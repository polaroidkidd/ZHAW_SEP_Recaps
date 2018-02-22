function [apriori_max_iterationen, aposteriori_max_iterationen, alpha] = func_max_itera(f, x0, low, high,apost_start_xn, tol)
format long;
syms x y;
fDiff = diff(f);
f = matlabFunction(f);
fDiff = matlabFunction(fDiff);
Fmin = f(low);
FMax = f(high);
%Bildet die Funktion auf sich selbst ab?
if(Fmin > low && FMax < high)
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
    %Alpha < 1?
    if(alpha < 1)
        disp('alpha < 1 => Konvergiert (anziehender Fixpunkt)')
        %PRIORI
        apriori_max_iterationen = (log((tol * (1-alpha))/abs(f(x0) - x0)))/log(alpha);
        
        
        %POSTERIORI
        apost_start_xn = 3;
        counter = 1;
        xnNext = f(x0);

        while(apost_start_xn > counter)
            xnPrev = xnNext;
            xnNext = f(xnNext);
            counter = counter + 1;
        end

        aposteriori_max_iterationen = (log((tol * (1-alpha))/abs(f(xnNext) - f(xnPrev))))/log(alpha);

    else
        disp('alpha > 1 => Konvergiert nicht (abstossender Fixpunkt)')
        aposteriori_max_iterationen = 'N/A';
        apriori_max_iterationen = 'N/A';
        alpha = 'N/A';
    end
else
    disp('Bildet nicht ab')
    aposteriori_max_iterationen = 'N/A';
    apriori_max_iterationen = 'N/A';
    alpha = 'N/A';
end


end