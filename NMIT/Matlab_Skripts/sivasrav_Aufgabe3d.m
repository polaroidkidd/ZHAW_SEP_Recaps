
%A = [10 4 20; 20 5 10; 5 10 2]
%b = [142;155;63]
% x0 = [2 ; 2 ; 2]
% tol = 10^-4;
% opt = 1;
% normstr = 'inf'

%Jacobi:     opt = 1
%Gauss-Sedel opt = 0
function [xn, n, n2] = sivasrav_Aufgabe3d(A,b,x0,tol,opt, normstr)
    D = diag(diag(A));
    L = tril(A)-D;
    R = triu(A)-D;
    fault = tol + 1;
    if(strcmp(normstr, '1'))
        norm_choice = 1;
    elseif(strcmp(normstr, '2'))
        norm_choice = 2;
    elseif(strcmp(normstr, 'inf'))
        norm_choice = 'inf';
    end
    
    if(opt==1)
        %a-priori
        B = norm((-D^(-1))*(L+R), norm_choice);
        x = norm((-(D^(-1))*(L+R)*x0+(D^(-1))*b)-x0, norm_choice);
        n2 = log(tol*(1-B)/x)/log(B);
        
        n = 0;
        x1 = x0;
        while(fault >= tol)
            n = n+1;
            x0 = x1;
            x1 = -(D^(-1))*(L+R)*x0+(D^(-1))*b;
            %a-posteriori
            x = norm(x1 - x0, norm_choice);
            fault = (B/(1-B))*x
        end
    elseif(opt==0)
        %a-priori
        B = norm((-(D+L)^(-1))*R, norm_choice);
        x = norm(-((D+L)^(-1))*R*x0+((D+L)^(-1))*b-x0, norm_choice);
        n2 = log(tol*(1-B)/x)/log(B);
        
        n = 0;
        x1 = x0;
        while(fault >= tol)
            n = n+1;
            x0 = x1;
            x1 = -((D+L)^(-1))*R*x0+((D+L)^(-1))*b;
            x = norm(x1 - x0, norm_choice);
            fault = (B/(1-B))*x;
        end
    end
    xn = x1;
    n
end
