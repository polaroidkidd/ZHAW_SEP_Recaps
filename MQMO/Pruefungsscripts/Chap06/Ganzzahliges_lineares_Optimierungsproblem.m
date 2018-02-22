% Ganzzahliges_lineares_Optimierungsproblem:

options = optimoptions('intlinprog', 'MaxTime', 120);

% Lohnkosten:
p = [480,480,480,480,480,560,560,560,560,455,455,455,455,455,455,455,455,455,455,455,455];

% Welche x-Werte sollen integer sein:
intcon = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21];

% Bedarf an Arbeitern pro Stunde
d = [25 23 20 16 24 31 27 14 14 22 24 25 21];
% Untere Grenze für y
l = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

% Verschiedene Schichtoptionen:
A = [ 1 0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0;
      1 1 0 0 0 1 1 0 0 1 1 0 0 0 0 1 1 0 0 0 0;
      1 1 1 0 0 1 1 1 0 1 1 1 0 0 0 1 1 1 0 0 0;
      1 1 1 1 0 1 1 1 1 0 1 1 1 0 0 1 1 1 1 0 0;
      0 1 1 1 1 0 1 1 1 1 0 1 1 1 0 0 1 1 1 1 0;
      1 0 1 1 1 0 0 1 1 1 1 0 1 1 1 1 0 1 1 1 1;
      1 1 0 1 1 1 0 0 1 1 1 1 0 1 1 1 1 0 1 1 1;
      1 1 1 0 1 1 1 0 0 1 1 1 1 0 1 1 1 1 0 1 1;
      1 1 1 1 0 1 1 1 0 0 1 1 1 1 0 0 1 1 1 0 1;
      0 1 1 1 1 1 1 1 1 0 0 1 1 1 1 0 0 1 1 1 0;
      0 0 1 1 1 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1;
      0 0 0 1 1 0 0 1 1 0 0 0 0 1 1 0 0 0 0 1 1;
      0 0 0 0 1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1];

% (-A und -d) => Minimierungsproblem
[x, kosten] = intlinprog(p, intcon, -A, -d, [], [], l, [], options);
x'
kosten

