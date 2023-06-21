%%
function mostrarHistrogramas(histO, histE, imgP, imgE)
% FUNCIÓN: "mostarHistogramas".
% En una ventana emergente, muestra los histogramas de la última imagen 
% ecualizada y su imagen original correspondiente.
% 
% Input:
%       imgO: matriz de la imagen original
%       imgE: matriz de la imagen ecualizada
%       imgP: matriz actual de la imagen procesada

% Excepciones
if isempty(histE)
    ME1 = MException('Histo:Null', 'SE DEBE ECUALIZAR A LA IMAGEN.');
    throw(ME1)
elseif ~isequal(imgE, imgP)
    ME2 = MException('Histo:Changes', 'SE DEBE VOLVER A ECUALIZAR A LA IMAGEN.');
    throw(ME2)
end

figure;
subplot(2, 1, 1);
bar(histO);
title('Histograma (Img. original)');
subplot(2, 1, 2);
bar(histE);
title('Histograma (Img. ecualizada)');