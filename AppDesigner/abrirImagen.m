%%
% FUNCIÓN: "abrirImagen".
% Abre, carga y muestra una imagen en la ventana (en el componente UIAxes 
% indicado como parámetro).
% 
% Input:
%       UIAxes: Componente de tipo 'app.UIAxes' donde se mostrará la imagen
% Output:
%       img:   Matriz de la imagen
%       map:   mapa de color si es indexada o cero en caso contrario
%       file:  nombre del archivo
%       path:  ruta de la imagen
%       type:  tipo de imagen (rgb, indexada, escala de grises o binaria)

function [img, map, path, type] = abrirImagen(UIAxes)

% Abrir ventana para seleccionar imagen con extensión permitida
[file, path] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl;*.png','Abrir imagen');
if file == 0
    return
end

% Colocar la imagen en el UIAxes correspondiente, dependiendo su tipo
if imfinfo(fullfile(path, file)).ColorType == "truecolor"
    type = "truecolor";
    map  = 0;
    img  = imread(fullfile(path, file));
    imshow(img, 'Parent', UIAxes);
elseif imfinfo(fullfile(path, file)).ColorType == "indexed"
    type = "indexed";
    [img, map] = imread(fullfile(path, file));
    imshow(img, map, 'Parent', UIAxes);
elseif imfinfo(fullfile(path, file)).ColorType == "grayscale" 
    if  imfinfo(fullfile(path, file)).BitDepth == 1 
        type = "grayscale";
        map  = 0;
        img  = imread(fullfile(path, file));
        imshow(img, 'Parent', UIAxes);
    else
        type = "grises";
        map = 0;
        img = imread(fullfile(path, file));
        imshow(img, 'Parent', UIAxes);
    end
end
