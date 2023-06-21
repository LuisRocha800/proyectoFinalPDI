function laplacianoFiltro4v = filtroLaplaciano4v(imgProcesada)

matrizLap4vec = [0 -1 0; -1 5 -1; 0 -1 0];

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);

laplacianoFiltro4v = imfilter(imagen_gris, matrizLap4vec);
% imshow(filtroBox, 'Parent', UIAxes);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

laplacianoFiltro4v = imfilter(imagen_gris, matrizLap4vec);
% imshow(filtroBox, 'Parent', UIAxes);

    else % Escala de grises
        imagen_gris = imgProcesada;

laplacianoFiltro4v = imfilter(imagen_gris, matrizLap4vec);
% imshow(filtroBox, 'Parent', UIAxes);
end