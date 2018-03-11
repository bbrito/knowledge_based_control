% triangular membership functions for input
#input in
    VL   #mf     1       1       1       1       2
    L    #mf     1       1       2       2       3
    M    #mf     1       2       3       3       4
    H    #mf     1       3       3       3       3
    VH   #mf     1       3       3       3       3

% singleton outputs
#output out1
    VL   #mf     1       1       1       1       1
    L    #mf     1       2       2       2       2
    M    #mf     1       3       3       3       3
    H    #mf     1       3       3       3       3
    VH   #mf     1       3       3       3       3

% singleton outputs
#output out2
    VL   #mf     1       1       1       1       1
    L    #mf     1       2       2       2       2
    M    #mf     1       3       3       3       3
    H    #mf     1       3       3       3       3
    VH   #mf     1       3       3       3       3
        
#rules
 If in is VL then out1 is VL, out2 is VL;
 if in is L then out1 is L, out2 is L;
 if in is M then out1 is M, out2 is M;
 if in is H then out1 is H, out2 is H;
 if in is VH then out1 is VH, out2 is VH;