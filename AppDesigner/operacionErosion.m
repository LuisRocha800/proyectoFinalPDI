function erosion = operacionErosion(imgProcesada, elemento)

disp(elemento);

valorTextArea = char(elemento);

elementos = strsplit(valorTextArea, ';');

matriz = [];

for i = 1:numel(elementos)
    fila = str2num(elementos{i});
    matriz = [matriz; fila];
end

disp(matriz);

erosion = imerode(imgProcesada, matriz);

% imshow(erosion, 'Parent', UIAxes);