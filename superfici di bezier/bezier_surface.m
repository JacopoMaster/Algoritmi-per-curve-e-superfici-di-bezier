function bezier_surface()
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
    
    % Calcolare le coordinate della superficie
    for i = 1:n
        for j = 1:n
            u = t(i);
            v = t(j);
            [x, y, z] = bezier_patch(control_points, u, v);
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
    title('Superficie di Bezier');
end

function [x, y, z] = bezier_patch(control_points, u, v)
    % Funzione che calcola il punto (x, y, z) sulla superficie di Bezier
    % usando i punti di controllo e i parametri u e v

    % Base di Bernstein per u e v
    Bu = [(1-u)^2, 2*(1-u)*u, u^2];
    Bv = [(1-v)^2, 2*(1-v)*v, v^2];

    % Calcolare le coordinate del punto sulla superficie
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
