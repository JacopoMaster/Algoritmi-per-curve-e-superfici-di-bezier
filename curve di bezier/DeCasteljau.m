function [x] = DeCasteljau(c, stampa, ascissa)
    % Usa l'algoritmo di De Casteljau per disegnare una curva di Bezier
    % c: ascissa o partizione su cui calcolare
    % stampa: opzione che stampa le combinazioni convesse intermedie
    % ascissa: ascissa in cui stampare le combinazioni convesse

    if nargin < 2
        stampa = 0;
        ascissa = 0;
    end

    % Creazione della figura per la selezione dei punti di controllo
    figure;
    title('Seleziona i punti di controllo con il mouse. Premi Invio per terminare.');
    xlabel('X');
    ylabel('Y');
    axis([0 1 0 1]);
    grid on;
    hold on;

    % Acquisizione dei punti di controllo
    [x_control, y_control] = ginput;
    bb = [x_control'; y_control'];
    n = size(bb, 2); % Numero di punti di controllo
    plot(bb(1,:), bb(2,:), 'bo-', 'DisplayName', 'Punti di controllo');

    d = length(c);
    x = zeros(2, d);

    % Calcolo della curva di Bézier usando l'algoritmo di De Casteljau
    for s = 1:d
        t = c(s);
        p = bb;
        for i = 1:n-1
            for j = 1:n-i
                p(:, j) = (1 - t) * p(:, j) + t * p(:, j+1);
            end
        end
        x(:, s) = p(:, 1);
    end

    % Plot della curva di Bézier
    plot(x(1,:), x(2,:), 'r-', 'DisplayName', 'Curva di Bézier');

    % Stampa delle combinazioni convesse intermedie se richiesto
    if stampa == 1
        t = ascissa;
        p = bb;
        for i = 1:n-1
            for j = 1:n-i
                p(:, j) = (1 - t) * p(:, j) + t * p(:, j+1);
            end
            if i == 1
                % Aggiungiamo "Combinazioni convesse" solo una volta nella legenda
                plot(p(1, 1:n-i), p(2, 1:n-i), 'kx-', 'DisplayName', 'Combinazioni convesse');
            else
                % Aggiungiamo i punti intermedi senza cambiare la legenda
                plot(p(1, 1:n-i), p(2, 1:n-i), 'kx-');
            end
        end
    end

    % Aggiungiamo solo una volta la voce per "Combinazioni convesse"
    if stampa == 1
        % Rimuoviamo voci duplicate nella legenda
        legend('Punti di controllo', 'Curva di Bézier', 'Combinazioni convesse');
    else
        legend('Punti di controllo', 'Curva di Bézier');
    end

    hold off;
end


