function compare_bezier_surfaces()
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
    X1 = zeros(n, n);
    Y1 = zeros(n, n);
    Z1 = zeros(n, n);
    X2 = zeros(n, n);
    Y2 = zeros(n, n);
    Z2 = zeros(n, n);

    % Parametri di Bezier
    t = linspace(0, 1, n);
    
    % Metodo diretto (Bernstein)
    for i = 1:n
        for j = 1:n
            u = t(i);
            v = t(j);
            [x, y, z] = bezier_patch(control_points, u, v);
            X1(i, j) = x;
            Y1(i, j) = y;
            Z1(i, j) = z;
        end
    end

    % Metodo di De Casteljau
    for i = 1:n
        for j = 1:n
            u = t(i);
            v = t(j);
            [x, y, z] = de_casteljau_patch(control_points, u, v);
            X2(i, j) = x;
            Y2(i, j) = y;
            Z2(i, j) = z;
        end
    end

    % Visualizzare le superfici
    figure;
    subplot(1, 2, 1);
    surf(X1, Y1, Z1);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Superficie di Bezier (Bernstein)');

    subplot(1, 2, 2);
    surf(X2, Y2, Z2);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Superficie di Bezier (De Casteljau)');
end

function [x, y, z] = bezier_patch(control_points, u, v)
    Bu = [(1-u)^2, 2*(1-u)*u, u^2];
    Bv = [(1-v)^2, 2*(1-v)*v, v^2];

    x = 0;
    y = 0;
    z = 0;
    index = 1;
    for i = 1:3
        for j = 1:3
            x = x + Bu(i) * Bv(j) * control_points(index, 1);
            y = y + Bu(i) * Bv(j) * control_points(index, 2);
            z = z + Bu(i) * Bv(j) * control_points(index, 3);
            index = index + 1;
        end
    end
end

function [x, y, z] = de_casteljau_patch(control_points, u, v)
    P = reshape(control_points, [3, 3, 3]);

    for r = 1:2
        for i = 1:(3-r)
            for j = 1:3
                P(i, j, :) = (1-u) * P(i, j, :) + u * P(i+1, j, :);
            end
        end
    end

    for r = 1:2
        for j = 1:(3-r)
            P(1, j, :) = (1-v) * P(1, j, :) + v * P(1, j+1, :);
        end
    end

    x = P(1, 1, 1);
    y = P(1, 1, 2);
    z = P(1, 1, 3);
end
