syms x xi x0 

x0 = 0;
f(x)= x^4-5.3*x^3-6.1*x^2+40*x+33;

fx = matlabFunction(f);
xi = x0;
start = 1;
while(start == 1 || abs(f(xi_plus))>=1e-4)
    start = 0;
    xi_plus = ((fx(xi))^2/(fx(xi+fx(xi))-fx(xi)));
    xi = xi_plus
end
x_schl = xi;
fi(xi) = abs(xi-x_schl)/abs(xi);
fi = matlabFunction(fi);

