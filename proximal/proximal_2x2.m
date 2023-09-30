function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distanta dintre doua puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    x_int = [1 : STEP : 2];
    y_int = [1 : STEP : 2];

    % Se afla numarul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    x_1 = y_1 = 1;
    x_2 = y_2 = 2;

    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n, n);
  
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            if i < round(n / 2)
                if j < round(n / 2)
                    out(i, j) = f(x_1, y_1);
                else
                    out(i, j) = f(x_1, y_2);
                endif
            else
                if j < round(n / 2)
                    out(i, j) = f(x_2, y_1);
                else
                    out(i, j) = f(x_2, y_2);
                endif
            endif
            % TODO: Calculeaza pixelul din imaginea finala.
        endfor
    endfor
endfunction
