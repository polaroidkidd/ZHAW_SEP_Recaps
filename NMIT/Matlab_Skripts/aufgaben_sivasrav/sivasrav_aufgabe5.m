q = 1.6022*1e-19;
k = 1.3806*1e-23;
L = 0.5;
T = 310;
V0 = 0.1
%tol = 1e-6

function [] = sivasrav_aufgabe5(f,x0,tol,nmax)

syms x;
f = matlabFunction(f);
xn = x0;
xold = -1;
n = 1;

while n < nmax && (abs(xn-xold) > tol)
    xold = xn;
    xn = f(xn);
    xn
    n = n + 1;
end
n

end