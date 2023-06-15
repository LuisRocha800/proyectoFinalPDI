function collage = createCollage(imagenes)

    ancho_collage = 800; 
    alto_collage = 600; 

    collage = uint8(zeros(alto_collage, ancho_collage, 3)); 

    num_imagenes = length(imagenes);
    alto_imagen = alto_collage / num_imagenes;
    ancho_imagen = ancho_collage;

    for i = 1:num_imagenes
        imagen = imresize(imagenes{i}, [alto_imagen, ancho_imagen]);

        fila_inicio = (i - 1) * alto_imagen + 1;
        fila_fin = i * alto_imagen;
        collage(fila_inicio:fila_fin, :, :) = imagen;
    end
end
