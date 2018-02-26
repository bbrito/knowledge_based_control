function robot_animate_provided(t,xa,par)

%% Augment state vector and hip position
x0=[-0.3215,    0.3215,    0,   0, ...
          0,         0,    0,   0];

xhip0 = [-par.a1*sin(x0(1)), par.a1*cos(x0(1))];

x = repmat(x0, numel(t), 1);
% substitute state for 4th and 8th 
x(:, 4) = xa(:, 1);
x(:, 8) = xa(:, 2);

xhip = repmat(xhip0, numel(t), 1);

%% Settings
colors = [1 0 0
          0 0 1
          0 0 0
          0 1 0];

%% Create link shapes
shape1 = linkshape(-par.a1);
shape2 = linkshape(-par.a2);
shape3 = linkshape( par.a3);
shape4 = linkshape(-par.a4);

%% Objects
animationfig = figure;
AxesHandle = axes('Parent',animationfig,  'Position',[0 0 1 1]);
link1 = patch('Parent',AxesHandle, 'FaceColor',colors(1,:));
link2 = patch('Parent',AxesHandle, 'FaceColor',colors(2,:));
link3 = patch('Parent',AxesHandle, 'FaceColor',colors(3,:));
link4 = patch('Parent',AxesHandle, 'FaceColor',colors(4,:));
floor = line('Parent',AxesHandle, 'Color',[0 0 0], 'LineWidth',2);

%% Animation
for n=1:length(t) 
    
    % state vector
    p1 = x(n,1);
    p2 = x(n,2);
    p3 = x(n,3);
    p4 = x(n,4);
    xh = xhip(n,1);
    yh = xhip(n,2);
    % leg positions
    pos1 = move(R(p1)*shape1,[xh;yh]);
    pos2 = move(R(p2)*shape2,[xh;yh]);
    pos3 = move(R(p3)*shape3,[xh;yh]);
    pos4 = move(R(p4)*shape4,[xh;yh]+R(p3)*[0;par.a3]);
    % potentially add rotation with slope gamma   
    set(link1,'Xdata',pos1(1,:),'Ydata',pos1(2,:));
    set(link2,'Xdata',pos2(1,:),'Ydata',pos2(2,:));
    set(link3,'Xdata',pos3(1,:),'Ydata',pos3(2,:));
    set(link4,'Xdata',pos4(1,:),'Ydata',pos4(2,:));
    
    % floor
    floor_pos = [-1, 4; -0.051 -0.051];
    set(floor,'Xdata',floor_pos(1,:),'Ydata',floor_pos(2,:));
    axis equal
    pause(0.05)
    drawnow
end

pause(1)
close(animationfig)


function shape = linkshape(l)
link_width = 0.1;
n   = linspace(pi/2,-pi/2,20);
top_arc    = (link_width/2)*[sin(n);cos(n)];
bottom_arc = (link_width/2)*[-sin(n);-cos(n)];
if l<0
    bottom_arc(2,:) = bottom_arc(2,:)+l;
else
    top_arc(2,:) = top_arc(2,:)+l;
end
shape = [top_arc, bottom_arc];


function rot = R(phi)
rot = [cos(phi)  -sin(phi);
       sin(phi)   cos(phi)];
   
function c = move(a, b)
c(1,:) = a(1,:) + b(1);
c(2,:) = a(2,:) + b(2);

        
