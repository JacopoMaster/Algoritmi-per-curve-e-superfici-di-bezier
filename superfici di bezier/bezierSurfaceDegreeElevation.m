function [Qx, Qy, Qz] = bezierSurfaceDegreeElevation(Px, Py, Pz, k)
    % Px, Py, Pz sono le coordinate dei punti di controllo originali
    % k è il numero di elevazioni di grado
    % Qx, Qy, Qz sono le coordinate dei nuovi punti di controllo elevati

    [m, n] = size(Px);
    m_new = m + k;
    n_new = n + k;
    
    % Inizializzazione dei nuovi punti di controllo
    Qx = zeros(m_new, n);
    Qy = zeros(m_new, n);
    Qz = zeros(m_new, n);
    
    % Degree elevation lungo u
    for j = 1:n
        % Ottieni la curva di controllo corrente lungo v
        Px_v = Px(:, j);
        Py_v = Py(:, j);
        Pz_v = Pz(:, j);
        
        % Applica l'elevazione di grado
        [Qx_v, Qy_v, Qz_v] = bezierCurveDegreeElevation(Px_v, Py_v, Pz_v, k);
        
        % Salva i nuovi punti di controllo
        Qx(:, j) = Qx_v;
        Qy(:, j) = Qy_v;
        Qz(:, j) = Qz_v;
    end
    
    % Inizializzazione dei nuovi punti di controllo per l'elevazione lungo v
    Qx_temp = zeros(m_new, n_new);
    Qy_temp = zeros(m_new, n_new);
    Qz_temp = zeros(m_new, n_new);
    
    % Degree elevation lungo v
    for i = 1:m_new
        % Ottieni la curva di controllo corrente lungo u
        Px_u = Qx(i, :);
        Py_u = Qy(i, :);
        Pz_u = Qz(i, :);
        
        % Applica l'elevazione di grado
        [Qx_u, Qy_u, Qz_u] = bezierCurveDegreeElevation(Px_u', Py_u', Pz_u', k); % Transpose to column vector
        
        % Salva i nuovi punti di controllo
        Qx_temp(i, :) = Qx_u';
        Qy_temp(i, :) = Qy_u';
        Qz_temp(i, :) = Qz_u';
    end
    
    % Assegna i risultati finali
    Qx = Qx_temp;
    Qy = Qy_temp;
    Qz = Qz_temp;
end



