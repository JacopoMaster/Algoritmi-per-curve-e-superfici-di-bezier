function P = de_casteljau(P, t)
    % Funzione di De Casteljau per un singolo passo di subdivision
    n = size(P, 1) - 1;
    for r = 1:n
        for i = 0:(n-r)
            P(i+1,:) = (1-t) * P(i+1,:) + t * P(i+2,:);
        end
    end
    P = P(1,:);
end
