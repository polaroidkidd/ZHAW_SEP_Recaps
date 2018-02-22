function[] = jacobian_matrix(nmax,f1,f2,xstart)

%Anwendung:
%Folgende Zeilen in der Konsole ausführen:
%f1 = x1+x2*exp(1.3*x3)-100;
%f2 = x1+x2*exp(1.6*x3)-250;
%f3 = x1+x2*exp(2*x3)-800;
%nmax = 1
%xstart = [1 2 3]';

%newtonForSystems(nmax,f1,f2,f3,xstart)

nmax = nmax-1;
syms x1 x2 x
Df = jacobian([f1, f2], [x1, x2]);
Df

Df = matlabFunction(Df, 'Vars', [x1, x2]);
f1 = matlabFunction(f1, 'Vars', [x1, x2]);
f2 = matlabFunction(f2, 'Vars', [x1, x2]);

Dfvec = @(x) Df(x(1), x(2));
fvec = @(x) [f1(x(1), x(2)); f2(x(1), x(2))];

xold = xstart;

jacobianMatrixAtXstart = Dfvec(xstart);
jacobianMatrixAtXstart 
fAtXstart = fvec(xstart);
fAtXstart
xn = zeros(2,1);
n = 0;
while (norm(fvec(xold), 2) > 10^-5) && (n <= nmax)    
    delta =  Dfvec(xold)\-fvec(xold); %für vereinfachtes Dfvec(xstart) einsetzen
    delta
    xn = xold + delta;
    xold = xn;
    xn
    n = n + 1;
end
n


end