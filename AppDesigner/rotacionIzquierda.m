% function imgRotaIzq = rotacionIzquierda(UIAxes)
function imgRotaIzq = rotacionIzquierda(imgProcesada)

imgRotaIzq = imrotate(imgProcesada, 45);

% imshow(imgRotaIzq, 'Parent', UIAxes);
