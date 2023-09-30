function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Se scaleaza imaginea folosind algoritmul de Interpolare Bicubic?.
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q.
    % =========================================================================
    [m n nr_colors] = size(I);

    % TODO: Initializeaza matricea finala drept o matrice nula.
    R = zeros(p, q);

    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % respectiv s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1]!

    % TODO: Calculeaza factorii de scalare
    % Obs: Daca se lucreaza cu indici in intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % TODO: Defineste matricea de transformare pentru redimensionare.
    T = [s_x 0; 0 s_y];

    % TODO: Calculeaza inversa transformarii.
    T_inv = [1 / s_x, 0; 0, 1 / s_y];

    % TODO: Precalculeaza derivatele.
    [I_x I_y I_xy] = precalc_d(I);

    I = double(I);
    % Parcurge fiecare pixel din imagine.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            b = T_inv * [x; y];
            x_p = b(1);
            y_p = b(2);

            % TODO: Trece (x_p, y_p) din sistemul de coordonate 0, n - 1 in
            % sistemul de coordonate 1, n pentru a aplica interpolarea.
            x_p = x_p + 1;
            y_p = y_p + 1;

            % TODO: Gaseste cele 4 puncte ce inconjoara punctul x, y
            x_1 = floor(x_p);
            y_1 = floor(y_p);
            x_2 = x_1 + 1;
            y_2 = y_1 + 1;

            if x_1 == n
                x_1 = x_1 - 1;
                x_2 = x_2 - 1;
            endif

            if y_1 == m
                y_1 = y_1 - 1;
                y_2 = y_2 - 1;
            endif

            % TODO: Calculeaza coeficientii de interpolare A.
            A = bicubic_coef(I, I_x, I_y, I_xy, x_1, y_1, x_2, y_2);

            % TODO: Trece coordonatele (x_p, y_p) in patratul unitate, scazand (x1, y1).
            x_p = x_p - x_1;
            y_p = y_p - y_1;

            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            % Obs: Pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n.
            R(y + 1, x + 1) = [1, x_p, x_p ^ 2, x_p ^ 3] * A * [1; y_p; y_p ^ 2; y_p ^ 3];
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction
