
% Aufgabe 1


% 1.1
lambda = 10;                                % Ankunftsrate
tEnd = 1000;                                % Zeit Simulationsende
n = lambda*tEnd;                            % ungefaehre Anzahl Ereignisse 
                                            % bis zum Simulationsende
tAnkunftUnsortiert = tEnd*rand(n, 1);       % Erzeugung von zufälligen 
                                            % Ankunftszeiten (Event Times)
                                            % mit Hilfe des Zufallszahlen-
                                            % generators für gleich-
                                            % verteilte Zufallsvariablen
tAnkunft = sort(tAnkunftUnsortiert);        % Chronologische Sortierung der 
                                            % Events


% 1.2
dt1 = diff(tAnkunft);                       % Berechnung der Zwischen-
                                            % ankunftszeiten
figure                                      % Oeffnen eines Figurfensters
histogram(dt1)                              % Histogramm der Zwischen-
                                            % ankunftszeiten
title('Verteilung der Zwischenankunftszeiten gemaess Aufgabe 1.2')
xlabel('Zwischenankunftszeiten (in Stunden)')
ylabel('Anzahl im Intervall')


% 1.3

dt2 = exprnd(1/lambda, 1, 10000);              % Berechnung der Zwischen-
                                            % ankunftszeiten, direkt mit 
                                            % Hilfe des Zufallszahlen-
                                            % generators für exponential-
                                            % verteilte Zufallsvariablen
figure
histogram(dt2)                              % Histogramm der Zwischen-
                                            % ankunftszeiten
title('Verteilung der Zwischenankunftszeiten gemaess Aufgabe 1.3')
xlabel('Zwischenankunftszeiten (in Stunden)')
ylabel('Anzahl im Intervall')


