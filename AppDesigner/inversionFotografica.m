function invFotografica = inversionFotografica(UIAxes)
global imgProcesada

[filas, columnas, canales] = size(imgProcesada);

if ndims(imgProcesada) == 2 && islogical(imgProcesada)

    msgbox('NO SE PUEDE HACER INVERSION FOTOGRAFICA A UNA IMAGEN BINARIA!');
    return;

elseif canales == 3
    aux = 255 - imgProcesada;
    invFotografica = rgb2gray(aux);
    imshow(invFotografica, 'Parent', UIAxes);

else
    valor_maximo = max(imgProcesada(:));
    invFotografica = valor_maximo - imgProcesada;
    imshow(invFotografica, 'Parent', UIAxes);
end
