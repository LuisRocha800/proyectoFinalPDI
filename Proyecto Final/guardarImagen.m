function  [guardar] = guardarImagen(res)
global formato almacenar
   formato = {'*.jpg','*.png'};
 %guardar = getimage(handles.axes2);
 
 if (guardar == 0)
     return,
 end
 
 [nomImg,directoryBT] = uiputfile(formato,'Almacenar Imagen');
 if (nomImg == 0)
     
     return,
 end
   
    NombArch = fullfile(directoryBT,nomImg);
                imwrite(almacenar,NombArch);
                            
   
end