function [] = newtonForSystemsWithMultipleStartpoints()

syms x y
f1 = (x^2/186^2) - (y^2/(300^2-186^2)) - 1;
f2 = ((y-500)^2/(279^2)) - ((x-300)^2/(500^2-279^2))-1;

Df = jacobian([f1,f2], [x,y]);
Df
Df = matlabFunction(Df, 'Vars', [x, y]);
f1 = matlabFunction(f1, 'Vars', [x, y]);
f2 = matlabFunction(f2, 'Vars', [x, y]);

%Damit die Funktionen auch Vektoren als Parameter akzeptieren
Dfvec = @(x) Df(x(1), x(2));
fvec = @(x) [f1(x(1),x(2)) ; f2(x(1),x(2))];

%Geschätzte Schnittpunkte:
%S1 = (-193; 66.5)
%S2 = (254; 219)
%S3 = (740; 906)
%S4 = (-1273; 1594)

Schnittpunkte = [-193, 254, 740, -1273;
                 66.5, 210, 906, 1594];
Schnittpunkte
%Für jeden Schnittpunkt die Lösung berechnen und ausgeben
for i=1:4
    xold = Schnittpunkte(:,i);
    xold
    disp(['Schnittpunkt ' num2str(i)]) 
    
    %Newton Verfahren für Systeme
    counter = 0;
    while (norm(fvec(xold)) >= 10^-5)       
        delta = Dfvec(xold)\-fvec(xold);
        xn = xold + delta;
        xold = xn;
        counter = counter + 1;
    end
    xn
    counter
end

end