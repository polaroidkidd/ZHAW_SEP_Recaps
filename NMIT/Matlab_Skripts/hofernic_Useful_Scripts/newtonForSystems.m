function[] = newtonForSystems(nmax,f1,f2,f3,xstart)

%Anwendung:
%Folgende Zeilen in der Konsole ausführen:
%f1 = x1+x2*exp(1.3*x3)-100;
%f2 = x1+x2*exp(1.6*x3)-250;
%f3 = x1+x2*exp(2*x3)-800;
%nmax = 1
%xstart = [1 2 3]';

%newtonForSystems(nmax,f1,f2,f3,xstart)

nmax = nmax-1;
%Variablen der Gleichung:
syms x1 x2 x3 x
%Jacobian Matrix erstellen:
Df = jacobian([f1, f2, f3], [x1, x2, x3]);
Df

%Matlab Fkt. erstellen:
Df = matlabFunction(Df, 'Vars', [x1, x2, x3]);
f1 = matlabFunction(f1, 'Vars', [x1, x2, x3]);
f2 = matlabFunction(f2, 'Vars', [x1, x2, x3]);
f3 = matlabFunction(f3, 'Vars', [x1, x2, x3]);

Dfvec = @(x) Df(x(1), x(2), x(3));
fvec = @(x) [f1(x(1), x(2), x(3)); f2(x(1), x(2), x(3)); f3(x(1), x(2), x(3))];

%xold = startVektor
xold = xstart;

%JacobianMatrix mit startvektor eingesetzt:
jacobianMatrixAtXstart = Dfvec(xstart);
jacobianMatrixAtXstart 
%Funktionsvektor mit startvektor eingesetzt:
fAtXstart = fvec(xstart);
fAtXstart

xn = zeros(3,1);
n = 0;
%Solange 2er Norm von fvec > toleranz   und  n <= nmax berechne xn:
while (norm(fvec(xold), 2) > 10^-5) && (n <= nmax)  
    delta = -inv(Dfvec(xold))*fvec(xold);
    delta
    xn = xold + delta;
    xold = xn;
    xn
    n = n + 1;
end
n


end


