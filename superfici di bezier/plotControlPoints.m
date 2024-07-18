% Funzione per visualizzare i punti di controllo
function plotControlPoints(Px, Py, Pz, titleText)
    hold on;
    plot3(Px, Py, Pz, 'ro-');
    for i = 1:size(Px, 1)
        plot3(Px(i, :), Py(i, :), Pz(i, :), 'ro-');
    end
    for j = 1:size(Px, 2)
        plot3(Px(:, j), Py(:, j), Pz(:, j), 'ro-');
    end
    title(titleText);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on;
    hold off;
end

