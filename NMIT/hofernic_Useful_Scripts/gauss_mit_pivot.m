function [A_triangle,detA,x] = gauss_mit_pivot(A,b)

%Example:
%Ohne vertauschen:
%[A_triangle,detA,x] = einardan_hofernic_ZH08_S7_Aufg2([-1,1,1;1,-3,-2;5,1,4],[0;5;3])
%Mit vertauschen:
%[A_triangle,detA,x] = einardan_hofernic_ZH08_S7_Aufg2([-1,1,1;5,1,4;1,-3,-2],[0;5;3])
%Test:
%[A_triangle,detA,x] = einardan_hofernic_ZH08_S7_Aufg2([1,5,6;7,9,6;2,3,4],[29;43;20])

%Input:
% A = Matrix, für welche die Oberedreiecksform, determinante und die Lösung
% berechnet werden soll.
% b = Lösung von A
%
% Output:
% A_triangle = Oberedreiecksform von A
% detA = Determinante von A
% x = Lösung des LSG


[anzahlZeilen, anzahlSpalten] = size(A);
x = zeros(anzahlZeilen,1);
anzahlVertauschungen = 0;
A_triangle = A;

% j = aktuelle Zeile
% i = aktuelle Spalte
%Gauss-Algorithmus ohne Pivotisierung
i = 1;
A_triangle
b
while i < anzahlSpalten
    j = i+1;
    %Vertauschung der Zeilen wenn nötig
    if A_triangle(i,i) == 0
        if A_triangle(j,i) == 0
            error('');
        end
        if A_triangle(j,i) ~= 0
            if A_triangle(i,i)
                A_triangle([i,j],:) = A_triangle([j,i],:); 
                b([i,j]) = b([j,i]);
                anzahlVertauschungen = anzahlVertauschungen + 1;
            end   
        end
    end      
    
    
    len = length(A);
    it = i;
    aki = 0;
    disp('a');
    while it < len
        temp = A(it,i);
        if aki < temp
            aki = temp;
            akindex = it;
        end
        akindex
        it = it +1;
    end
    A_triangle([i,akindex],:)=A_triangle([akindex,i],:);
    b([i,akindex],:)=b([akindex,i],:);
    
    A_triangle
    b
    disp('Eliminationsverfahren');
    %Eliminationsverfahren
    while j <= anzahlSpalten  
        
        lambda = (A_triangle(j,i)/A_triangle(i,i));
        lambda
        A_triangle(j,:) = A_triangle(j,:) - lambda * A_triangle(i,:);
        b(j) = b(j) - lambda * b(i);
        j = j + 1;
        
        A_triangle
        b
    end
    i = i +1;
end


%Rückeinsetzen:
for i = anzahlSpalten:-1:1
    j = i + 1;
    summe = 0;
    while j <= anzahlSpalten
        summe = summe + A_triangle(i,j) * x(j);
        j = j + 1;
    end
    x(i) = (b(i) - summe) / A_triangle(i,i);
end

%Determinante von A berechnen:
detA = (-1)^anzahlVertauschungen;
for i = 1:anzahlZeilen
	detA = detA * A_triangle(i,i);
end


