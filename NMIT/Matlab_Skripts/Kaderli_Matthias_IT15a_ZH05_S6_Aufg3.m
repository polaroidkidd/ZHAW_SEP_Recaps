%Kaderli_Matthias_IT15a_ZH05_S6_Aufg3(@(x) exp(1).^(x.^2) + x.^(-3) -10,-1,-1.2, 10^-3) 
%
%Probleme mit Newton-Verfahren Implementierung: das Normale Newton Verfahren
%verlangt eine Ableitung. Diese für eine beliebige Funktion per Code zu
%generieren können wir noch nicht.



function [y] = Kaderli_Matthias_IT15a_ZH05_S6_Aufg3(f, x0, x1, tol)
result = zeros(100,1);
result(1) = x0;
result(2) = x1;

counter = 2;

while f(result(counter)-tol)*f(result(counter)+tol) > 0

    result(counter+1) = result(counter) -((result(counter)-result(counter-1))/(f(result(counter))-f(result(counter-1))))*f(result(counter));
    counter = counter + 1;
    
end

y = result(counter);

end
