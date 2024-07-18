function [X, Y, Z] = bezierSurface(Px, Py, Pz, u, v)
    [m, n] = size(Px);
    X = zeros(length(u), length(v));
    Y = zeros(length(u), length(v));
    Z = zeros(length(u), length(v));
    
    for i = 1:length(u)
        for j = 1:length(v)
            X(i, j) = 0;
            Y(i, j) = 0;
            Z(i, j) = 0;
            for k = 0:m-1
                for l = 0:n-1
                    bernstein_u = nchoosek(m-1, k) * u(i)^k * (1-u(i))^(m-1-k);
                    bernstein_v = nchoosek(n-1, l) * v(j)^l * (1-v(j))^(n-1-l);
                    X(i, j) = X(i, j) + bernstein_u * bernstein_v * Px(k+1, l+1);
                    Y(i, j) = Y(i, j) + bernstein_u * bernstein_v * Py(k+1, l+1);
                    Z(i, j) = Z(i, j) + bernstein_u * bernstein_v * Pz(k+1, l+1);
                end
            end
        end
    end
end
