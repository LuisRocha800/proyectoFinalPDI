function imgespejo = espejo(UIAxes)
global imgProcesada
global aux

aux = imgProcesada;

l1=fliplr(imgProcesada);
l2=flipud(aux);
l3=fliplr(l2);

aux2 = [l2 l3;imgProcesada l1];
imgespejo = imresize(aux2,.5);

imshow(imgespejo, 'Parent', UIAxes);