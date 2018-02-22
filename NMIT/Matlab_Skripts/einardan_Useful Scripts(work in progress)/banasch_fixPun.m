function [nullStelle, alpha] = banasch_fixPun (f, low, high, x0, tol)
%f => gross F
%low => unteres Intervallende [a,b], also a
%high => oberes Intervallende [a,b], also b
syms x;
format long;
fDiff = diff(f);

f = matlabFunction(f);
fDiff = matlabFunction(fDiff);

fMin = f(low);
fMax = f(high);
%Bildet auf sich selber ab?
    if (fMin > low && fMax < high)
        disp('Bildet ab weil f(low) > low und f(high) < high')
        step = 10^-6;
        temp = low;
        alpha = abs(fDiff(low));
        %Alpha Berechnen
        while (temp <= high)
            temp_alpha = abs(fDiff(temp));
            if(alpha < temp_alpha)
                alpha = temp_alpha;
            end
            temp = temp + step;
        end
        if(0 < alpha && alpha < 1)
            disp('alpha < 1 => Konvergiert (anziehender Fixpunkt)')
            x_next = f(x0);
            x_previous = x0;
            fault = tol + 1;
            %A priori
            counter = 1;
            x1 = f(x0);
            while(fault >= tol)
                x_previous = x_next;
                x_next = f(x_next);
                fault = ((alpha^counter)/(1-alpha))*abs(x1 - x0);
                counter = counter + 1;
            end
            nullStelle = x_next;
            nullStelle
            iterationen = counter
        else
            disp('alpha > 1 => Konvergiert nicht (abstossender Fixpunkt)')
            nullStelle = 'N/A';
        end
    else
        disp('bildet nicht ab');
        nullStelle = 'N/A';
    end

end