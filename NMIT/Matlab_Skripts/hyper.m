syms x
%f = 6*((exp(x)-exp(-x))/exp(x)+exp(-x));
f = 6*tanh(x) + x;
f_strich = diff(f)

f = matlabFunction(f);
f_strich = matlabFunction(f_strich);
xn1 = 4;
tol = 10^-3;
xn = xn1;

xold  = tol + xn + 1;
%for index = 1:1000 
while abs(xold-xn) >= tol
    xold = xn;
    xn = xn - f(xn)/f_strich(xn);
    xn
end