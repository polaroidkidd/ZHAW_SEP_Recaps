A = [1 0 2;0 1 0;1e-6 0 1e-6];
b = [1;1;0];
cond(A,inf)
eta = cond(A,inf)*0.1;

b_schl =[1;1;6.0000e+05]

x_schl =inv(A)* b_schl
x = inv(A)*b

rel_err = (norm((x_schl-x),inf))/norm(x,inf)