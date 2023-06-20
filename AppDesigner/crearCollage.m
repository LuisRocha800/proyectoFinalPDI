function collage = crearCollage(imgProcesada, img2, img3, img4, img5, img6, img7, img8, img9)

if ndims(imgProcesada) == 3
else
 imgProcesada = cat(3, imgProcesada, imgProcesada, imgProcesada);
end


if ndims(img2) == 3
else
 img2 = cat(3, img2, img2, img2);
end

if ndims(img3) == 3
else
 img3 = cat(3, img3, img3, img3);
end

if ndims(img4) == 3
else
img4 = cat(3, img4, img4, img4);
end

if ndims(img5) == 3
else
img5 = cat(3, img5, img5, img5);
end

if ndims(img6) == 3
else
img6 = cat(3, img6, img6, img6);
end

if ndims(img7) == 3
else
img7 = cat(3, img7, img7, img7);
end

if ndims(img8) == 3
else
img8 = cat(3, img8, img8, img8);
end

if ndims(img9) == 3
else
 img9 = cat(3, img9, img9, img9);
end

sizeDeseado = [1000, 800];

a = imresize(imgProcesada, sizeDeseado);
b = imresize(img2, sizeDeseado);
c = imresize(img3, sizeDeseado);
d = imresize(img4, sizeDeseado);
e = imresize(img5, sizeDeseado);
f = imresize(img6, sizeDeseado);
g = imresize(img7, sizeDeseado);
h = imresize(img8, sizeDeseado);
i = imresize(img9, sizeDeseado);

aa = size(a);
bb = size(b);
cc = size(c);
dd = size(d);
ee = size(e);
ff = size(f);
gg = size(g);
hh = size(h);
ii = size(i);

disp(aa);
disp(bb);
disp(cc);
disp(dd);
disp(ee);
disp(ff);
disp(gg);
disp(hh);
disp(ii);

collage = [a b c; d e f; g h i];

% imshow(collage, 'Parent', UIAxes);
   