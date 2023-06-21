function imagenBinaria = inversionBinaria(imgProcesada)

[filas, columnas, canales] = size(imgProcesada);

if ndims(imgProcesada) == 2 && islogical(imgProcesada)

    imagenBinaria = ~imgProcesada;

elseif canales == 3
    imagen_gris = rgb2gray(imgProcesada);
    imagenBinaria = imbinarize(imagen_gris);

elseif canales == 1
    imagenBinaria = imbinarize(imgProcesada);

end
