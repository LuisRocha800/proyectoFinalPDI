%%
% FUNCIÓN: "abrirImagen".
% Abre, carga y muestra una imagen en la ventana (en el componente UIAxes 
% indicado como parámetro).
% 
% Input:
%       UIAxes: Componente de tipo 'app.UIAxes' donde se mostrará la imagen
% Output:
%       img:  Matriz de la imagen
%       map:  mapa de color si es indexada o cero en caso contrario
%       path: ruta completa de la imagen
%       type: tipo de imagen (rgb, indexada, escala de grises o binaria)

function [img, map, path, type] = abrirImagen(UIAxes)

% Abrir ventana para seleccionar imagen con extensión permitida
[file, folder] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl;*.png;*.jpeg','Abrir imagen');
if file == 0
    return
end

% Crear ruta completa de la imagen
path = fullfile(folder, file);

% Colocar la imagen en el UIAxes correspondiente, dependiendo su tipo
if imfinfo(path).ColorType == "truecolor"
    type = "truecolor";
    map  = 0;
    img  = imread(path);
    imshow(img, 'Parent', UIAxes);
elseif imfinfo(path).ColorType == "indexed"
    type = "indexed";
    [img, map] = imread(path);
    imshow(img, map, 'Parent', UIAxes);
elseif imfinfo(path).ColorType == "grayscale" 
    if  imfinfo(path).BitDepth == 1 
        type = "grayscale";
        map  = 0;
        img  = imread(path);
        imshow(img, 'Parent', UIAxes);
    else
        type = "grises";
        map = 0;
        img = imread(path);
        imshow(img, 'Parent', UIAxes);
    end
end