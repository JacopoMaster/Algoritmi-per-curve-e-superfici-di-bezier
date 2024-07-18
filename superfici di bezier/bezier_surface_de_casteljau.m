function bezier_surface_de_casteljau()
    % Definire i punti di controllo
    control_points = [
        1, 1, 1;
        2, 1, 0;
        3, 1, 1;
        1, 2, 0;
        2, 2, 1;
        3, 2, 0;
        1, 3, 1;
        2, 3, 0;
        3, 3, 1
    ];

    % Numero di divisioni
    n = 30;
    
    % Matrici per la superficie
    X = zeros(n, n);
    Y = zeros(n, n);
    Z = zeros(n, n);

    % Parametri di Bezier
    t = linspace(0, 1, n);
    
    % Calcolare le coordinate della superficie usando De Casteljau
    for i = 1:n
        for j = 1:n
            u = t(i);
            v = t(j);
            [x, y, z] = de_casteljau_patch(control_points, u, v);
            X(i, j) = x;
            Y(i, j) = y;
            Z(i, j) = z;
        end
    end

    % Visualizzare la superficie di Bezier
    surf(X, Y, Z);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Superficie di Bezier con Algoritmo di De Casteljau');
end

function [x, y, z] = de_casteljau_patch(control_points, u, v)
    % Funzione che calcola il punto (x, y, z) sulla superficie di Bezier
    % usando l'algoritmo di De Casteljau con i parametri u e v

    % Riorganizzare i punti di controllo in una griglia 3x3
    P = reshape(control_points, [3, 3, 3]);

    % Applicare l'algoritmo di De Casteljau lungo la direzione u
    for r = 1:2
        for i = 1:(3-r)
            for j = 1:3
                P(i, j, :) = (1-u) * P(i, j, :) + u * P(i+1, j, :);
            end
        end
    end

    % Applicare l'algoritmo di De Casteljau lungo la direzione v
    for r = 1:2
        for j = 1:(3-r)
            P(1, j, :) = (1-v) * P(1, j, :) + v * P(1, j+1, :);
        end
    end

    % Il punto finale sulla superficie di Bezier
    x = P(1, 1, 1);
    y = P(1, 1, 2);
    z = P(1, 1, 3);
end
