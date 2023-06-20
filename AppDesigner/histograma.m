% function imgEcualizada = histograma(UIAxes)
function imgEcualizada = histograma(imgProcesada)
     
     [filas, columnas, canales] = size(imgProcesada);

     if canales == 3
        imgGris = rgb2gray(imgProcesada);
        imgEcualizada = histeq(imgGris);
        % imshow(imgEcualizada, 'Parent', UIAxes);
        
     elseif ndims(imgProcesada) == 2 && islogical(imgProcesada)
        msgbox('NO SE PUEDE ECUALIZAR UNA IMAGEN BINARIA!');
        return;
     else
         imgEcualizada = histeq(imgProcesada);
         % imshow(imgEcualizada, 'Parent', UIAxes);
     end