function laplacianoFiltro8v = filtroLaplaciano8v(imgProcesada)

matrizLap8vec = [-1 -1 -1; -1 9 -1; -1 -1 -1];

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

laplacianoFiltro8v = imfilter(imagen_gris, matrizLap8vec);
% imshow(filtroBox, 'Parent', UIAxes);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

laplacianoFiltro8v = imfilter(imagen_gris, matrizLap8vec);
% imshow(filtroBox, 'Parent', UIAxes);

    else % Escala de grises
        imagen_gris = imgProcesada;

laplacianoFiltro8v = imfilter(imagen_gris, matrizLap8vec);
% imshow(filtroBox, 'Parent', UIAxes);
end