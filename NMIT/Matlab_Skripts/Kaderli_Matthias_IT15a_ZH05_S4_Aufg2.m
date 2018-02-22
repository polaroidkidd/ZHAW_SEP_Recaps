% [root, xit, n ] = Kaderli_Matthias_IT15a_ZH05_S4_Aufg2(@(x) x^2 -2, 0, 2, 10^-9)

function [root, xit, n ] = Kaderli_Matthias_IT15a_ZH05_S4_Aufg2(func,a, b, tol )


% Kaderli_Matthias_IT15a_ZH05_S4_Aufg2  Executes Bisektionsverfahren 
%
% Input values      func  function to iterate over
%                   a     leftmost number in the search intervall
%                   b     rightmost number in the search intervall
%                   tol   minimal difference between search interval during
%                         iteration. Function stops when this value is
%                         reached.
%
% Return values:    root  Approximation of Zewro of a function
%                   xit   Vector(1x1) with Iteration values (average of
%                         both intervall limits)
%                   n     Counter of needed Iterations until tol was
%                         reached
%
%  

    
    if func(a)*func(b) > 0
        error('No Zero of a function');
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

