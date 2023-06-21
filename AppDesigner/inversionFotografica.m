%%
% FUNCIÓN: "inversionFotografica".
% Invierte imagen binaria aplicando inversion fotografica.
% 
% Input:
%       img:  matriz de la imagen a invertir
%       type: tipo de la imagen a invertir
% Output:
%       invFotografica: imagen invertida

function invFotografica = inversionFotografica(img, type)

% Excepciones
if ~(type == "grayscale")
    if ~(type == "truecolor")
        ME = MException('Image:TypeError', 'LA IMAGEN A INVERTIR DEBE ESTAR EN ESCALA DE GRISES O RGB.');
        throw(ME)
    end
end

% Funcionalidad
invFotografica = 255 - img;