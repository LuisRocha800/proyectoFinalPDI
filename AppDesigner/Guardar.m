function Guardar()
 global imgProcesada

if imgProcesada == 0
    return
end
formatos = {'*.jpg;*.tif;*.bmp;*.ppm;*.mdl'};
[nomb,ruta] = uiputfile(formatos,'Magia imagen');
if nomb == 0,return,end
fName = fullfile(ruta,nomb);
imwrite(save,fName);
msgbox('Se ha guardado con exito!');
