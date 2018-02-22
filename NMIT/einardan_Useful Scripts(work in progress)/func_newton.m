function [nullstelle] = func_newton(f, x0, max_iterations, tol, xLinSpaceMin, xLinSpaceMax, xLinSpaceStep)
syms x;
format long;

fDiff = diff (f);

f = matlabFunction(f);
fDiff = matlabFunction(fDiff);

x_previous = x0;
x_next = x0 - (f(x0))/(fDiff(x0));


counter = 0;
while (abs(x_next - x_previous) > tol && max_iterations >= counter)
   x_previous = x_next;
   x_next = x_previous - (f(x_previous))/(fDiff(x_previous)); 
   counter = counter + 1;
end
counter;
if(counter < max_iterations)
    nullstelle = x_next;
    x = linspace(xLinSpaceMin, xLinSpaceMax, xLinSpaceStep);
    plot(x,f(x));
    grid;
else
    nullstelle = 'kann nicht gefunden werden';
if (counter >= max_iterations)
    disp('funktion springt zwischen zwei punkten hin und her')
    x1 = x0 - (f(x0))/(fDiff(x0));
    x2 = x1 - (f(x1))/(fDiff(x1));
    x3 = x2 - (f(x2))/(fDiff(x2));
    
    g1 = f(x0) + fDiff(x0)*(x-x0);
    g1 = matlabFunction(g1);

    g2 = f(x1) + fDiff(x1)*(x-x1);
    g2 = matlabFunction(g2);
    
    g3 = f(x2) + fDiff(x2)*(x-x2);
    g3 = matlabFunction(g3);

    x = linspace(xLinSpaceMin, xLinSpaceMax, xLinSpaceStep);
    plot(x,f(x), x, g1(x), x, g2(x), x, g3(x));
    legend('f(x)', 'g1(x)', 'g2(x)', 'g3(x)');

    grid;
    return;
end
end