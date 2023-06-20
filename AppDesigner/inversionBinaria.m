function imagenBinaria = inversionBinaria(imgProcesada)

[filas, columnas, canales] = size(imgProcesada);

if ndims(imgProcesada) == 2 && islogical(imgProcesada)
    imagenBinaria1 = imbinarize(imgProcesada);
 
    imagenBinaria = ~imagenBinaria1;
    % imshow(imagenBinaria, 'Parent', UIAxes);

elseif canales == 3
    imagen_gris = rgb2gray(imgProcesada);
    imagenBinaria1 = imbinarize(imagen_gris);
    imagenBinaria = ~imagenBinaria1;
    % imshow(imagenBinaria, 'Parent', UIAxes);

else
    imagenBinaria = ~imgProcesada;
    % imshow(imagenBinaria, 'Parent', UIAxes);
end
