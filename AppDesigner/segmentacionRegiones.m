function regionSegmentacion = segmentacionRegiones(imgProcesada, coordenadaX, coordenadaY)

I = im2double(imgProcesada);

x = coordenadaX;
y = coordenadaY;

J = regionCrecimiento(I,x,y,0.2); 

regionSegmentacion = (I + J);
