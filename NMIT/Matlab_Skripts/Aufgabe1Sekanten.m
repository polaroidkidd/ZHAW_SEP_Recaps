function [] = Aufgabe1Sekanten(x1, x0)

f = @(x) exp(1).^(x.^2) + x.^(-3) -10;

next = x1-((x1-x0)/(f(x1)-f(x0)))*f(x1)


end
