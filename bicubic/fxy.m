function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata.
    [m n] = size(f);

    if (x < 2) || (y < 2) || (x + 1 > m) || (y + 1 > n)
        r = 0;
        return
    endif

    r = (f(x - 1, y - 1) + f(x + 1, y + 1) - f(x + 1, y - 1) - f(x - 1, y + 1)) / 4;
endfunction
