function tipoNFilter = filtroTipoN(UIAxes)
global imgProcesada
global parametro

if size(imgProcesada, 3) == 3 % RGB
        imagen_gris = rgb2gray(imgProcesada);
  
         disp(parametro)
         tamano_filtro_str = str2double(parametro);
    sizeFiltro = str2double(tamano_filtro_str);

    % Verifica si el valor es válido
    if isnan(sizeFiltro) || sizeFiltro <= 0
    
        msgbox('INGRESE UN PARAMETRO VALIDO PARA EL FILTRO, NO PUEDE SER MENOR O IGUAL A CERO!');
        return;
    end

filtroN = ones(sizeFiltro) / (sizeFiltro ^ 2);

tipoNFilter = imfilter(imagen_gris, filtroN);

        imshow(tipoNFilter, 'Parent', UIAxes);

    elseif islogical(imgProcesada) % Binaria
        imagen_gris = uint8(imgProcesada) * 255;

 
         tamano_filtro_str = str2double(parametro);

    sizeFiltro = str2double(tamano_filtro_str);

    % Verifica si el valor es válido
    if isnan(sizeFiltro) || sizeFiltro <= 0
    
        msgbox('INGRESE UN PARAMETRO VALIDO PARA EL FILTRO, NO PUEDE SER MENOR O IGUAL A CERO!');
        return;
    end

filtroN = ones(sizeFiltro) / (sizeFiltro ^ 2);

tipoNFilter = imfilter(imagen_gris, filtroN);

        imshow(tipoNFilter, 'Parent', UIAxes);
    else % Escala de grises
        imagen_gris = imgProcesada;


         tamano_filtro_str = str2double(parametro);

    sizeFiltro = str2double(tamano_filtro_str);

    % Verifica si el valor es válido
    if isnan(sizeFiltro) || sizeFiltro <= 0
    
        msgbox('INGRESE UN PARAMETRO VALIDO PARA EL FILTRO, NO PUEDE SER MENOR O IGUAL A CERO!');
        return;
    end

filtroN = ones(sizeFiltro) / (sizeFiltro ^ 2);

tipoNFilter = imfilter(imagen_gris, filtroN);

        imshow(tipoNFilter, 'Parent', UIAxes);
end