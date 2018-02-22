
%Wahrscheinlichkeit das Flugzeuge nicht länger als 10 min warten:
Anteil_kleiner_als_10min = sum((waitingTimesInQueue.Data*60)<10)/length(waitingTimesInQueue.Data)
