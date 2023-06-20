function dilatacion = operacionDilatacion(imgProcesada, elemento)

valorTextArea = char(elemento);

elementos = strsplit(valorTextArea, ';');

matriz = [];

for i = 1:numel(elementos)
    fila = str2num(elementos{i});
    matriz = [matriz; fila];
end

dilatacion = imdilate(imgProcesada, matriz);

% imshow(dilatacion, 'Parent', UIAxes);