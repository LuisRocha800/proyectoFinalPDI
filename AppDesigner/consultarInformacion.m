%%
% FUNCIÓN: "consultarInformacion".
% Muestra las características de la imagen en una ventana flotante.
% 
% Input:
%       path: ruta completa de la imagen

function consultarInformacion(path)

if isempty(path)
    % Mostrar mensaje de error
    msgbox('ERROR: NO HAY IMAGEN ABIERTA.');
else
    % Mostrar info. de imagen
    imageinfo(path);
end
