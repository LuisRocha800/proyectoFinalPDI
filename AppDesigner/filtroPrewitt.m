function prewittFilter = filtroPrewitt(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);
    filtro_prewitt = fspecial('prewitt');
    prewittFilter = imfilter(imagen_gris, filtro_prewitt);

    % imshow(prewittFilter, 'Parent', UIAxes);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    filtro_prewitt = fspecial('prewitt');
    prewittFilter = imfilter(imagen_gris, filtro_prewitt);

    % imshow(prewittFilter, 'Parent', UIAxes);

else % Escala de grises
    imagen_gris = imgProcesada;

    filtro_prewitt = fspecial('prewitt');
    prewittFilter = imfilter(imagen_gris, filtro_prewitt);

    % imshow(prewittFilter, 'Parent', UIAxes);
end
