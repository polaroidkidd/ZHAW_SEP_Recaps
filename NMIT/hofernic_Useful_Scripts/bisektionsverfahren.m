function [root,xit,n] = bisektionsverfahren(func,a,b,tol)

%Example: [root,xit,n] = bisektionsverfahren(@(x) cos(x).*sin(x),2,4,10^-5)
%Funktion:   Bisektionsverfahren
%Input:      func  = Funktion, bei der NS gesucht sind
%            a     = Start Zahl des Suchinterval
%            b     = Ende des Suchinterval
%            tol   = Toleranz
%
% Return:    root  = Angenäherte Nullstelle
%            xit   = Vector(1x1) Iterationswert
%            n     = Iteration


if func(a)*func(b) > 0
    error('No zero function');
end

if(b < a)
    error('a must be smaller than b');
end

counter = 1;
xit(1) = (b+a)/2;

while abs((a-b)/2) > tol && (abs((a-b)/2) ~= eps)      
    if(func((a+b)/2)*func(a) <= 0)
        b = (a+b)/2;
        a = a;
    else
        a = (a+b)/2;
        b = b;
    end
    counter = counter + 1;
    xit(counter) = (b+a)/2;
end
        
root = xit(counter);
n = counter;

end

