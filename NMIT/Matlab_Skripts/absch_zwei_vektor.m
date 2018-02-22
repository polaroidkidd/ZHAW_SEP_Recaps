%Fehlerrechnung für zwei fehlerbehaftete Vektoren 
A = [2 4;4 8.1];
A_schl = [2.003 4.003;4.003 8.103];
A_minus = [0.003 0.003; 0.003 0.003];
b = [1;1.5];
b_minus = [0.1;0.1];
rel_error = cond(A,inf)/(1-cond(A,inf)*(norm(A_minus,inf)/norm(A,inf)))*((norm(A_minus,inf)/norm(A,inf))+(norm(b_minus,Inf)/norm(b,inf)))