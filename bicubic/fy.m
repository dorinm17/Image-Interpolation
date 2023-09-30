function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    [m n] = size(f);
    
    if (y < 2) || (y + 1 > n)
        r = 0;
        return
    endif

    r = (f(x, y + 1) - f(x, y - 1)) / 2;
endfunction
