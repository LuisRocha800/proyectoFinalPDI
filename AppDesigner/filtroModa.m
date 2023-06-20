function modaFilter = filtroModa(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    modaFilter = ordfilt2(imagen_gris, 5, true(3));
    % imshow(modaFilter, 'Parent', UIAxes);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    modaFilter = ordfilt2(imagen_gris, 5, true(3));
    % imshow(modaFilter, 'Parent', UIAxes);

else % Escala de grises
    imagen_gris = imgProcesada;

    modaFilter = ordfilt2(imagen_gris, 5, true(3));
    % imshow(modaFilter, 'Parent', UIAxes);

end
