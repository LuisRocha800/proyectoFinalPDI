%%
% FUNCIÓN: "cargarImagen".
% Abre ventana de selección de archivos. Permite al ususario seleccionar
% una imagen y recupera la información de la imagen seleccionada.
% Si se cancela la operación se retornan variables vacías.
% 
% Output:
%       img:  matriz de la imagen
%       map:  mapa de color
%       path: ruta completa de la imagen
%       type: tipo color de la imagen

function [img, map, path, type] =  abrirImagen()

% Abrir ventana para seleccionar imagen con extensión permitida
[file, folder] = uigetfile('*.bmp;*.jpg;*.jpeg;*.ppm;*.png;*.tif');

% Terminar si se cierra la ventana
if (file == 0)
    img  = [];
    map  = [];
    path = [];
    type = [];
else
    
    % Crear ruta completa de la imagen
    path = fullfile(folder, file);

    if imfinfo(path).ColorType == "indexed"
        [img, map] = imread(path);
        type = "indexed";
    else
        img  = imread(path);
        map  = [];
        if imfinfo(path).ColorType == "truecolor"
            type = "truecolor"; 
        elseif imfinfo(path).BitDepth == 1 
            type = "binary"; 
        else
            type = "grayscale"; 
        end
    end

end