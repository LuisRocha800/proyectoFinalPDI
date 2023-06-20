function filtroBox = filtroCaja(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

tamFiltroCaja = 3;
filtroBox = imboxfilt(imagen_gris, tamFiltroCaja);
% imshow(filtroBox, 'Parent', UIAxes);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

tamFiltroCaja = 3;
filtroBox = imboxfilt(imagen_gris, tamFiltroCaja);
% imshow(filtroBox, 'Parent', UIAxes);

    else % Escala de grises
        imagen_gris = imgProcesada;

tamFiltroCaja = 3;
filtroBox = imboxfilt(imagen_gris, tamFiltroCaja);
% imshow(filtroBox, 'Parent', UIAxes);
end