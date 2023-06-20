% function imgRotaDer = rotacionDerecha(UIAxes)
function imgRotaDer = rotacionDerecha(imgProcesada)

imgRotaDer = imrotate(imgProcesada, -45);

% imshow(imgRotaDer, 'Parent', UIAxes);