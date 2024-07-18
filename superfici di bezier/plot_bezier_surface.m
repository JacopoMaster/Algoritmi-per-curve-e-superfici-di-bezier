function plot_bezier_surface(P)
    % Plot di una superficie di Bézier
    [n, m, ~] = size(P);
    n = n - 1;
    m = m - 1;
    
    % Valori di u e v
    u = linspace(0, 1, 50);
    v = linspace(0, 1, 50);
    [U, V] = meshgrid(u, v);
    
    % Superficie di Bézier
    X = zeros(size(U));
    Y = zeros(size(U));
    Z = zeros(size(U));
    
    for i = 1:length(u)
        for j = 1:length(v)
            Bu = bernstein_polynomial(n, u(i));
            Bv = bernstein_polynomial(m, v(j));
            for k = 1:n+1
                for l = 1:m+1
                    X(i,j) = X(i,j) + Bu(k) * Bv(l) * P(k,l,1);
                    Y(i,j) = Y(i,j) + Bu(k) * Bv(l) * P(k,l,2);
                    Z(i,j) = Z(i,j) + Bu(k) * Bv(l) * P(k,l,3);
                end
            end
        end
    end
    
    % Plot della superficie
    surf(X, Y, Z);
    shading interp;
    colormap jet;
    alpha 0.6;
end

function B = bernstein_polynomial(n, t)
    % Calcola i polinomi di Bernstein di grado n in t
    B = zeros(1, n+1);
    for i = 0:n
        B(i+1) = nchoosek(n, i) * t^i * (1-t)^(n-i);
    end
end

