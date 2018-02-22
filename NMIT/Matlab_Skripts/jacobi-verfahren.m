A = [4 -1 1; -2 5 1; 1 -2 5]
b = [5;11;12]
D = diag(diag(A))
L = tril(A)-D
R = triu(A)-D
x = [0;0;0]
k = 0;
B = -inv(D)*(L+R)
if(norm(B,inf)<1)
    disp('anziehender Punkt')
else
    disp('abstossender Punkt')
while (k < 10)
    xn = -inv(D)*(L+R)*x + inv(D)*b
    x = xn;
    k = k + 1;
end
