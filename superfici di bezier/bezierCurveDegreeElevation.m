function [Qx, Qy, Qz] = bezierCurveDegreeElevation(Px, Py, Pz, k)
    % Px, Py, Pz sono le coordinate dei punti di controllo originali della curva
    % k è il numero di elevazioni di grado
    % Qx, Qy, Qz sono le coordinate dei nuovi punti di controllo elevati

    n = length(Px) - 1; % Grado originale della curva
    n_new = n + k; % Nuovo grado della curva
    
    % Inizializzazione dei nuovi punti di controllo
    Qx = zeros(1, n_new + 1);
    Qy = zeros(1, n_new + 1);
    Qz = zeros(1, n_new + 1);
    
    % Calcolo dei nuovi punti di controllo
    Qx(1) = Px(1);
    Qy(1) = Py(1);
    Qz(1) = Pz(1);
    for i = 1:n
        alpha = i / (n + 1);
        Qx(i + 1) = (1 - alpha) * Px(i) + alpha * Px(i + 1);
        Qy(i + 1) = (1 - alpha) * Py(i) + alpha * Py(i + 1);
        Qz(i + 1) = (1 - alpha) * Pz(i) + alpha * Pz(i + 1);
    end
    Qx(n_new + 1) = Px(n + 1);
    Qy(n_new + 1) = Py(n + 1);
    Qz(n_new + 1) = Pz(n + 1);
end
