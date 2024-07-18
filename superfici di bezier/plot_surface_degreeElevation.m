% Punti di controllo della superficie di Bézier originale
Px = [0 1 2; 0 1 2; 0 1 2];
Py = [0 0 0; 1 1 1; 2 2 2];
Pz = [0 1 0; 1 2 1; 0 1 0];
k = 1;

% Calcolo dei punti della superficie originale
u = linspace(0, 1, 10); % Ridotto numero di punti per una visualizzazione più chiara
v = linspace(0, 1, 10); % Ridotto numero di punti per una visualizzazione più chiara
[X, Y, Z] = bezierSurface(Px, Py, Pz, u, v);

% Visualizzazione dei punti di controllo e della superficie originale
figure;
subplot(1, 2, 1);
plotControlPoints(Px, Py, Pz, 'Punti di controllo originali');
subplot(1, 2, 2);
surf(X, Y, Z);
title('Superficie di Bézier originale');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;

% Elevazione di grado della superficie
[Qx, Qy, Qz] = bezierSurfaceDegreeElevation(Px, Py, Pz, k);

% Calcolo dei punti della superficie elevata
[Xe, Ye, Ze] = bezierSurface(Qx, Qy, Qz, u, v);

% Visualizzazione dei punti di controllo e della superficie elevata
figure;
subplot(1, 2, 1);
plotControlPoints(Qx, Qy, Qz, 'Punti di controllo dopo elevazione di grado');
subplot(1, 2, 2);
surf(Xe, Ye, Ze);
title('Superficie di Bézier dopo elevazione di grado');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
