function [] = jacobi_with_variable()

syms a

A = [30,10,5 ; 10, a, 20; 5,20,50];
b = [5*a;a;5*a];
x0 = [a;0;a];


D = diag(diag(A));
Dinv = -inv(D);
R = triu(A)-D;
L = tril(A)-D;
xn = x0;
xn = Dinv * ( (L+R) * xn - b);

%Ausgabe
D
Dinv
R
L
xn

end