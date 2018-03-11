% triangular membership functions for input
#input in
    L   #mf     1       0       1       1       2
    M   #mf     1       1       2       2       3
    H   #mf     1       2       3       3       4

% singleton outputs
#output out1
    L   #mf     1       1       1       1       1
    M   #mf     1       2       2       2       2
    H   #mf     1       3       3       3       3
       
#rules
 If in is L then out1 is H;
 if in is M then out1 is M;
 if in is H then out1 is L;
