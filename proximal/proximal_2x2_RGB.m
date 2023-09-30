function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB - Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    Red = img(:, :, 1);

    % TODO: Extrage canalul verde al imaginii.
    Green = img(:, :, 2);

    % TODO: Extrage canalul albastru al imaginii.
    Blue = img(:, :, 3);

    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    Red_out = proximal_2x2(Red, STEP);
    Green_out = proximal_2x2(Green, STEP);
    Blue_out = proximal_2x2(Blue, STEP);

    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.o
    out = cat(3, Red_out, Green_out, Blue_out);
endfunction
