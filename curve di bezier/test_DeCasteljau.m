% Esempio di utilizzo con ginput per selezionare i punti di controllo

% Parametri
c = linspace(0, 1, 100); % Partizione su cui calcolare
stampa = 1; % Opzione per stampare le combinazioni convesse intermedie
ascissa = 0.5; % Ascissa in cui stampare le combinazioni convesse

% Esecuzione dell'algoritmo di De Casteljau
[x] = DeCasteljau(c, stampa, ascissa);
