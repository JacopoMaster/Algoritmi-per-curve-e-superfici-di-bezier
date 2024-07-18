function elevated_points = degree_elevation_bezier(control_points)
    % degree_elevation_bezier Eleva il grado di una curva di Bézier di un livello
    %
    %   elevated_points = degree_elevation_bezier(control_points)
    %   restituisce i nuovi punti di controllo per la curva di Bézier di grado elevato.
    %
    %   control_points: matrice Nx2 dei punti di controllo iniziali
    %   elevated_points: matrice (N+1)x2 dei nuovi punti di controllo

    % Numero di punti di controllo
    n = size(control_points, 1) - 1;
    
    % Matrice per i nuovi punti di controllo
    elevated_points = zeros(n + 2, 2);
    
    % Primo punto di controllo rimane lo stesso
    elevated_points(1, :) = control_points(1, :);
    
    % Calcolo dei nuovi punti di controllo
    for i = 1:n
        elevated_points(i + 1, :) = (i / (n + 1)) * control_points(i, :) + (1 - i / (n + 1)) * control_points(i + 1, :);
    end
    
    % Ultimo punto di controllo rimane lo stesso
    elevated_points(n + 2, :) = control_points(n + 1, :);
end
