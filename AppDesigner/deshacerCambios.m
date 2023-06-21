% function deshacerCambio = deshacerCambios(UIAxes)
function deshacerCambio = deshacerCambios(imgDeshacer)

% Excepciones
if isempty(imgDeshacer)
    ME1 = MException('Image:Empty', 'ERROR: NO HAY IMAGEN ABIERTA!');
    throw(ME1)
end

deshacerCambio = imgDeshacer;
