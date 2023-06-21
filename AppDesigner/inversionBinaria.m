%%
% FUNCIÓN: "inversionBinaria".
% Invierte imagen binaria aplicando inversion binaria.
% 
% Input:
%       img:  imagen a invertir
%       type: tipo de la imagen a invertir
% Output:
%       imagenBinaria: imagen invertida

function imagenBinaria = inversionBinaria(img, type)

% Excepciones
if ~(type == "binary")
    ME = MException('Image:TypeError', 'LA IMAGEN A INVERTIR DEBE SER BINARIA.');
    throw(ME)
end

% Funcionalidad
imagenBinaria = 1 - img;