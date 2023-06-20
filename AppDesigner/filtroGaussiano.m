function gaussFilter = filtroGaussiano(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    sigma = 2;
    gaussFilter = imgaussfilt(imagen_gris, sigma);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    sigma = 2;
    gaussFilter = imgaussfilt(imagen_gris, sigma);
else % Escala de grises
    imagen_gris = imgProcesada;

    sigma = 2;
    gaussFilter = imgaussfilt(imagen_gris, sigma);
end

% imshow(gaussFilter, 'Parent', UIAxes);