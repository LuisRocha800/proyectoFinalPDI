function regionSegmentacion = segmentacionRegionesSinCoordenadas(imgProcesada)

I = im2double(imgProcesada);

J = regionCrecimiento(I); 

regionSegmentacion = (I + J);
