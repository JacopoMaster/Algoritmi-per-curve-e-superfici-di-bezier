% bezierSubdivisionMain.m

function bezierSubdivisionMain
    close all;
    figure;
    axis([0 1 0 1]);
    hold on;
    grid on;

    title('Clicca per aggiungere i nodi. Premi invio per terminare.');
    xlabel('X');
    ylabel('Y');

    % Ottieni i punti di controllo dall'utente
    [x, y] = ginput;
    controlPoints = [x, y];

    % Visualizza i punti di controllo
    plot(controlPoints(:, 1), controlPoints(:, 2), 'bo-', 'LineWidth', 1.5, 'MarkerFaceColor', 'b', 'DisplayName', 'Punti di Controllo');

    % Visualizza la curva di Bézier originale
    plotBezierCurve(controlPoints, 'b', '-', 'Curva di Bézier Originale');

    % Suddividi la curva di Bézier
    [leftCurve, rightCurve] = bezierSubdivision(controlPoints, 0.5);

    % Visualizza le curve suddivise
    plotBezierCurve(leftCurve, 'r', '--', 'Curva Bézier Suddivisa (Parte Sinistra)');
    plotBezierCurve(rightCurve, 'g', '--', 'Curva Bézier Suddivisa (Parte Destra)');

    % Aggiungi la legenda
    legend('show', 'Location', 'Best');

    title('Curva di Bézier originale e suddivisa');

    hold off;
end

function plotBezierCurve(points, color, lineStyle, displayName)
    t = linspace(0, 1, 100);
    bezierCurve = zeros(length(t), 2);
    n = size(points, 1) - 1;

    for i = 1:length(t)
        bezierCurve(i, :) = [0, 0];
        for j = 0:n
            bernsteinPoly = nchoosek(n, j) * (t(i)^j) * ((1 - t(i))^(n - j));
            bezierCurve(i, :) = bezierCurve(i, :) + bernsteinPoly * points(j + 1, :);
        end
    end

    plot(bezierCurve(:, 1), bezierCurve(:, 2), 'Color', color, 'LineStyle', lineStyle, 'LineWidth', 2, 'DisplayName', displayName);
end
