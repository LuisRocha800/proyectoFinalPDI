function sobelFilter = filtroSobel(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);
    filtro_sobel = fspecial('sobel');
    sobelFilter = imfilter(imagen_gris, filtro_sobel);

    % imshow(sobelFilter, 'Parent', UIAxes);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    filtro_sobel = fspecial('sobel');
    sobelFilter = imfilter(imagen_gris, filtro_sobel);

    % imshow(sobelFilter, 'Parent', UIAxes);

else % Escala de grises
    imagen_gris = imgProcesada;

    filtro_sobel = fspecial('sobel');
    sobelFilter = imfilter(imagen_gris, filtro_sobel);

    % imshow(sobelFilter, 'Parent', UIAxes);
end
