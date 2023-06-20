function mostrarHistrogramas(auxiliarHistogramOrig, auxiliarHistogramEcu)

    hist_original = imhist(auxiliarHistogramOrig);

    hist_ecualizado = imhist(auxiliarHistogramEcu);

    figure;
    subplot(2, 1, 1);
    bar(hist_original);
    title('Histograma Original');
    subplot(2, 1, 2);
    bar(hist_ecualizado);
    title('Histograma Ecualizado');
end


