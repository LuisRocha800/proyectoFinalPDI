%%
% FUNCIÓN: "abrirImagen".
% Abre, carga y muestra una imagen en el UIAxes indicado como parámetro
% 
% Input:
%       UIAxes: Componente de tipo 'app.UIAxes' donde se mostrará la imagen
% Output:
%       imagen: Matriz de la imagen abierta.
%       mapa: mapa de color
%       nombre: file name de la imagen abierta
%       path: ruta de la imagen
%       indx: extensión de la imagen
function [imagen, mapa, nombre, path, indx] = abrirImagen(UIAxes)

% Abrir ventana para seleccionar archivo con extensión permitida
[nombre, path, indx] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl;*.png','Abrir');
if nombre==0
    return
end

% Colocar la imagen en el UIAxes correspondiente
[imagen, mapa] = imread(fullfile(path, nombre));
imshow(imagen, 'Parent', UIAxes);
