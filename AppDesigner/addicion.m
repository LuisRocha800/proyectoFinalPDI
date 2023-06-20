function imgadd = addicion(imgProcesada)

[filename,pathname]=uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl;*.png','Abrir');
imagenDos = imread(filename);

SizeImg1 = size(imgProcesada);
sizeImg2 = size(imagenDos);

if prod(SizeImg1) > prod(sizeImg2)
    img1Sized = imresize(imgProcesada, sizeImg2(1:2));
    img2Sized = sizeImg2;
else
    img1Sized = imgProcesada;
    img2Sized = imresize(imagenDos, SizeImg1(1:2));
end

imgadd = img1Sized + img2Sized;

% imshow(imgadd, 'Parent', UIAxes);
