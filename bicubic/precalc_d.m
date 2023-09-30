function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);
    
    % TODO: Tranforma matricea I in double.
    I = double(I);

    % TODO: Calculeaza matricea cu derivate fata de x Ix.
    % TODO: Calculeaza matricea cu derivate fata de y Iy.
    % TODO: Calculeaza matricea cu derivate fata de xy Ixy.
    for i = [1 : m]
        for j = [1 : n]
            Iy(i, j) = fx(I, i, j);
            Ix(i, j) = fy(I, i, j);
            Ixy(i, j) = fxy(I, i, j);
        endfor
    endfor
endfunction
