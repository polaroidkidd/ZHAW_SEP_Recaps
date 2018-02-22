function [] = fixpunktiteration(f,x0,tol,nmax)

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