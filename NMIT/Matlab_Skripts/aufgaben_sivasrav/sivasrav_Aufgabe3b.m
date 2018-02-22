A = [10 4 20; 20 5 10; 5 10 2]
b = [142;155;63]
D = diag(diag(A))
L = tril(A)-D
R = triu(A)-D
x = [2;2;2]
k = 0;
B = -inv(D)*(L+R)
if(norm(B,inf)<1)
    disp('anziehender Punkt')
else
    disp('abstossender Punkt')
end
while (k < 2)
    xn = -inv(D)*(L+R)*x + inv(D)*b
    x = xn;
    k = k + 1;
end
