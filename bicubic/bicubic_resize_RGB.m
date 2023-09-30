function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    Red = img(:, :, 1);

    % TODO: Extrage canalul verde al imaginii.
    Green = img(:, :, 2);

    % TODO: Extrage canalul albastru al imaginii.
    Blue = img(:, :, 3);

    % TODO: Aplica functia bicubic pe cele 3 canale ale imaginii.
    Red_out = bicubic_resize(Red, p, q);
    Green_out = bicubic_resize(Green, p, q);
    Blue_out = bicubic_resize(Blue, p, q);

    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    out = cat(3, Red_out, Green_out, Blue_out);
endfunction
