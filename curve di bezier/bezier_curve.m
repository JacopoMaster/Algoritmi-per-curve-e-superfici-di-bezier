function curve = bezier_curve(control_points, t)
    % bezier_curve Calcola i punti di una curva di Bézier
    %
    %   curve = bezier_curve(control_points, t) restituisce i punti della
    %   curva di Bézier per i parametri t.
    %
    %   control_points: matrice Nx2 dei punti di controllo
    %   t: vettore dei parametri
    %   curve: matrice dei punti della curva

    n = size(control_points, 1) - 1;
    curve = zeros(length(t), 2);
    
    for i = 1:length(t)
        for j = 0:n
            bernstein_poly = nchoosek(n, j) * (t(i)^j) * ((1 - t(i))^(n - j));
            curve(i, :) = curve(i, :) + bernstein_poly * control_points(j + 1, :);
        end
    end
end

