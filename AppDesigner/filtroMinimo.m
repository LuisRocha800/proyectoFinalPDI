function minimoFilter = filtroMinimo(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    minimoFilter = ordfilt2(imagen_gris,1,ones(3,3));
    % imshow(minimoFilter, 'Parent', UIAxes);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    minimoFilter = ordfilt2(imagen_gris,1,ones(3,3));
    % imshow(minimoFilter, 'Parent', UIAxes);

else % Escala de grises
    imagen_gris = imgProcesada;

    minimoFilter = ordfilt2(imagen_gris,1,ones(3,3));
    % imshow(minimoFilter, 'Parent', UIAxes);

end
