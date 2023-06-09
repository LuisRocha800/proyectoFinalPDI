%%
function [imgC, mapC, typeC] = convertirImagen(typeTo, img, map, type)
% FUNCIÓN: "convertirImagen".
% Convierte el tipo de la imagen, al tipo especificado como parámetro. 
% Las imágenes producidas tiene variables de tipo logical para (binarias), 
% uint8 (escala de grises y rgb) y [uint8, double] (indexadas)
%
% Input:
%       typeTo: tipo al que se convierte la imagen
%       img:    matriz de la imagen a convertir
%       map:    mapa de color de la imagen
%       type:   tipo de la imagen

% Funcionalidad
if typeTo == "Indexada"
    
    typeC = "indexed";
    if type == "indexed"
        imgC  = img;
        mapC  = map;
    elseif type == "binary"
        [imgC, mapC] = gray2ind(img, 2);
    elseif type == "grayscale"
        [imgC, mapC] = gray2ind(img, 256);
    else
        [imgC, mapC] = rgb2ind(img, 256);
    end

elseif typeTo == "RGB"

    typeC = "truecolor";
    mapC  = [];
    if type == "indexed"
        imgC  = im2uint8(ind2rgb(img, map));
    elseif type == "binary"
        [auximg,auxmap] = gray2ind(img, 2);
        imgC = im2uint8(ind2rgb(auximg,auxmap));
    elseif type == "grayscale"
        [auximg,auxmap] = gray2ind(img, 256);
        imgC = im2uint8(ind2rgb(auximg,auxmap));
    else
        imgC = img;
    end

elseif typeTo == "Escala de Grises"

    typeC = "grayscale";
    mapC  = [];
    if type == "indexed"
        imgC  = im2uint8(ind2gray(img, map));
    elseif type == "binary"
        imgC = uint8(255 * img);
    elseif type == "grayscale"
        imgC = img;
    else
        imgC = rgb2gray(img);
    end
    
elseif typeTo == "Binaria"

    typeC = "binary";
    mapC  = [];
    if type == "indexed"
        imgC  = imbinarize(im2single(ind2gray(img, map)));
    elseif type == "binary"
        imgC = img;
    elseif type == "grayscale"
        imgC = imbinarize(im2single(img));
    else
        imgC = imbinarize(im2gray(img));
    end

end
