function imgSus = sustraccion(imgProcesada)

[filas, columnas, canales] = size(imgProcesada);

[filename,pathname]=uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl;*.png','Abrir');
%imagenDos = imread(filename);

% Terminar si se cierra la ventana
if (filename == 0)
    img  = [];
    map  = [];
    path = [];
    type = [];
else

    path = fullfile(pathname, filename);
     [imagenDos, map] = imread(path);
    
[filas2, columnas2, canales2] = size(imagenDos);

end

if canales == 3 && canales2 == 3

%imgProcesada = rgb2gray(imgProcesada);
%imagenDos = rgb2gray(imagenDos);
imgSus = imsubtract(imgProcesada,imagenDos);

elseif canales == 3 && canales2 == 1

    imgProcesada = rgb2gray(imgProcesada);
    imgSus = imsubtract(imgProcesada,imagenDos);

elseif canales == 1 && canales2 == 3

    imagenDos = rgb2gray(imagenDos);
    imgSus = imsubtract(imgProcesada,imagenDos);

elseif canales == 1 && canales2 == 1

    imgSus = imsubtract(imgProcesada,imagenDos);

elseif canales == 3 && ndims(imagenDos) == 2 && islogical(imagenDos)
 
imgProcesada = rgb2gray(imgProcesada);
imagenDos = uint8(imagenDos) * 255;
imgSus = imsubtract(imgProcesada,imagenDos);

elseif canales == 1 && ndims(imagenDos) == 2 && islogical(imagenDos)
 
imagenDos = uint8(imagenDos) * 255;
imgSus = imsubtract(imagenDos,imgProcesada);

elseif  ndims(imgProcesada) == 2 && islogical(imgProcesada) && canales2 == 3
 
imgProcesada =  uint8(imgProcesada) * 255;
imagenDos = rgb2gray(imagenDos);
imgSus = imsubtract(imagenDos,imgProcesada);

elseif  ndims(imgProcesada) == 2 && islogical(imgProcesada) && canales2 == 1
 
imgProcesada =  uint8(imgProcesada) * 255;
imgSus = imsubtract(imgProcesada,imagenDos);

elseif  ndims(imgProcesada) == 2 && islogical(imgProcesada) && ndims(imagenDos) == 2 && islogical(imagenDos)
 
imgSus = imsubtract(imgProcesada,imagenDos);

else
    msgbox('UNA DE LAS IMAGENES CORRESPONDE A UN FORMATO DESCONOCIDO');
end