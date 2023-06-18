function imgRotaDer = rotacionDerecha(UIAxes)
global imgProcesada

imgRotaDer = imrotate(imgProcesada, -45);

imshow(imgRotaDer, 'Parent', UIAxes);