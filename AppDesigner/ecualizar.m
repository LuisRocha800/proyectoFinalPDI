%%
function [imgE, histO, histE] = ecualizar(img, type)
% FUNCIÓN: "ecualizar".
% Ecualiza una imagen. Si la imagen no está en escala de grises se muestra
% mensaje.
% 
% Input:
%       img:  matriz de la imagen a ecualizar
%       type: tipo de la imagen a ecualizar
% Output:
%       imgE:  imagen ecualizada
%       histO: histograma de la imagen original
%       histE: histograma de la imagen ecualizada

% Excepciones
if ~(type == "grayscale")
    ME = MException('Image:TypeError', 'ERROR: LA IMAGEN DEBE ESTAR EN ESCALA DE GRISES');
    throw(ME)
end

% Funcionalidad
imgE  = histeq(img);
histO = imhist(img);
histE = imhist(imgE);