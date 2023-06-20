function medianaFilter = filtroMediana(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    medianaFilter = medfilt2(imagen_gris, [3, 3]);

    % imshow(medianaFilter, 'Parent', UIAxes);
elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    medianaFilter = medfilt2(imagen_gris, [3, 3]);

    % imshow(medianaFilter, 'Parent', UIAxes);
else % Escala de grises
    imagen_gris = imgProcesada;

    medianaFilter = medfilt2(imagen_gris, [3, 3]);

    % imshow(medianaFilter, 'Parent', UIAxes);
end