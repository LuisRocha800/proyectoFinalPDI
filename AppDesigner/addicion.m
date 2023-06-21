%%
% FUNCIÓN: "addicion".
% Realiza adición de imágenes. Las operaciones se hacen entre imagenes del 
% mismo tipo y solo permite operar con binarias, escala de grises y rgb.
% La imagen resultante tiene el tamanio de la img operada mas chica.
% 
% Input:
%       img1: matriz de la imagen 1 a sumar
%       img2: matriz de la imagen 2 a sumar
% Output:
%       result: adicion de las matrices de las imagenes img1 e img2

function result = addicion(img1, type1, img2, type2)

% Excepciones
if or( (type1 == "indexed"), (type2 == "indexed") )
    ME = MException('Image:TypeError', 'OPERACION NO DISPONIBLE PARA IMAGENES INDEXADAS.');
    throw(ME)
end
if ~(type1 == type2)
    ME = MException('Image:TypeError', 'LAS IMAGENES DEBEN SER DEL MISMO TIPO.');
    throw(ME)
end

% Funcionalidad
size1 = size(img1);
size2 = size(img2);
if type1 == "truecolor"
    size1(:,3) = [];
    size2(:,3) = [];
end
if ~(isequal(size1, size2))
    if prod(size1) > prod(size2)
        img1 = imresize(img1, size2);
    else
        img2 = imresize(img2, size1);
    end
end
result = img1 + img2;