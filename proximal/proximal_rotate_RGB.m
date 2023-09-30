function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    Red = img(:, :, 1);

    % TODO: Extrage canalul verde al imaginii.
    Green = img(:, :, 2);

    % TODO: Extrage canalul albastru al imaginii.
    Blue = img(:, :, 3);

    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    Red_out = proximal_rotate(Red, rotation_angle);
    Green_out = proximal_rotate(Green, rotation_angle);
    Blue_out = proximal_rotate(Blue, rotation_angle);

    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, Red_out, Green_out, Blue_out);
endfunction
