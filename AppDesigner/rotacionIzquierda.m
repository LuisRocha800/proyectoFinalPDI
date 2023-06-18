function imgRotaIzq = rotacionIzquierda(UIAxes)
global imgProcesada

imgRotaIzq = imrotate(imgProcesada, 45);

imshow(imgRotaIzq, 'Parent', UIAxes);
