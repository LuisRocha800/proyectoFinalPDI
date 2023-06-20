function robertsFilter = filtroRoberts(imgProcesada)

if size(imgProcesada, 3) == 3 % RGB
    imagen_gris = rgb2gray(imgProcesada);

    kernelHorizontal = [1 0; 0 -1];
    kernelVertical = [0 1; -1 0];

    filtroHorizontal = imfilter(imagen_gris, kernelHorizontal);
    filtroVertical = imfilter(imagen_gris, kernelVertical);

    robertsFilter = abs(filtroHorizontal) + abs(filtroVertical);

    %imshow(cat(3, robertsFilter, []), 'Parent', UIAxes);

elseif islogical(imgProcesada) % Binaria
    imagen_gris = uint8(imgProcesada) * 255;

    kernelHorizontal = [1 0; 0 -1];
    kernelVertical = [0 1; -1 0];

    filtroHorizontal = imfilter(imagen_gris, kernelHorizontal);
    filtroVertical = imfilter(imagen_gris, kernelVertical);

    robertsFilter = abs(filtroHorizontal) + abs(filtroVertical);

    % imshow(cat(3, robertsFilter, []), 'Parent', UIAxes);

else % Escala de grises
    imagen_gris = imgProcesada;

    kernelHorizontal = [1 0; 0 -1];
    kernelVertical = [0 1; -1 0];

    filtroHorizontal = imfilter(imagen_gris, kernelHorizontal);
    filtroVertical = imfilter(imagen_gris, kernelVertical);

    robertsFilter = abs(filtroHorizontal) + abs(filtroVertical);

    % imshow(cat(3, robertsFilter, []), 'Parent', UIAxes);
end
