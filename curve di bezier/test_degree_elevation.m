% Esempio di utilizzo con ginput per selezionare i punti di controllo

% Creazione della figura per la selezione dei punti di controllo
figure;
title('Seleziona i punti di controllo con il mouse. Premi Invio per terminare.');
xlabel('X');
ylabel('Y');
axis([0 10 0 10]);
grid on;
hold on;

% Selezione dei punti di controllo
[x, y] = ginput;
control_points = [x, y];

% Collegamento dei punti di controllo
plot(control_points(:, 1), control_points(:, 2), 'b-o', 'DisplayName', 'Punti di controllo originali');

% Elevazione del grado della curva di Bézier
elevated_points = degree_elevation_bezier(control_points);

% Plot della curva originale e della curva con grado elevato
t = linspace(0, 1, 100);
original_curve = bezier_curve(control_points, t);
elevated_curve = bezier_curve(elevated_points, t);

% Visualizzazione delle curve
plot(original_curve(:, 1), original_curve(:, 2), 'b-', 'DisplayName', 'Curva originale');
plot(elevated_curve(:, 1), elevated_curve(:, 2), 'r--', 'DisplayName', 'Curva grado elevato');

% Collegamento dei punti di controllo elevati
plot(elevated_points(:, 1), elevated_points(:, 2), 'r-o', 'DisplayName', 'Punti di controllo elevati');

legend;
hold off;

