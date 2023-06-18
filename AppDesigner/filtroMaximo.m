function maximoFilter = filtroMaximo(UIAxes)
global imgProcesada

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

        maximoFilter = ordfilt2(imagen_gris,9,ones(3,3));
        imshow(maximoFilter, 'Parent', UIAxes);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

        maximoFilter = ordfilt2(imagen_gris,9,ones(3,3));
        imshow(maximoFilter, 'Parent', UIAxes);

    else % Escala de grises
        imagen_gris = imgProcesada;

        maximoFilter = ordfilt2(imagen_gris,9,ones(3,3));
        imshow(maximoFilter, 'Parent', UIAxes);

end