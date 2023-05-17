function varargout = Operaciones_Morfologicas(varargin)


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Operaciones_Morfologicas_OpeningFcn, ...
                   'gui_OutputFcn',  @Operaciones_Morfologicas_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Operaciones_Morfologicas is made visible.
function Operaciones_Morfologicas_OpeningFcn(hObject, eventdata, handles, varargin)
global imagen
global mapa
axes(handles.axOriginal)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
%handles.imgRe=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);
axes(handles.axPro)
imshow(imagen,mapa)

set(handles.S,'Min',1,'Max',21,'Value',1,'SliderStep',[0.05 0.1]);
handles.s=get(handles.S,'Value')
set(handles.text5,'String',handles.s);
guidata(hObject,handles);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Operaciones_Morfologicas_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global imagen
imagen=handles.img;
close(Operaciones_Morfologicas);
Menu_Principal

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Guardar.
function Guardar_Callback(hObject, eventdata, handles)
save = getimage(handles.axPro);
if save == 0
    return
end
formatos = {'*.jpg;*.bmp;*.tif'};
[nomb,ruta] = uiputfile(formatos,'Magia imagen');
if nomb == 0,return,end
fName = fullfile(ruta,nomb);
imwrite(save,fName);
msgbox('Se ha guardado con exito!');

% hObject    handle to Guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global imagen
global mapa
%global img
[nombre,dire,indx] = uigetfile( ...
{'*.jpg;*.tif;*.bmp;*.ppm;*.mdl'}, ...
   'Abrir');
if nombre==0
    return
end
[imagen,mapa]=imread(fullfile(dire,nombre));
axes(handles.axOriginal)
imshow(imagen,mapa)
axes(handles.axPro)
imshow(imagen,mapa)
handles.img=imagen;
handles.imgCopia=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
guidata(hObject,handles);
set(handles.Cuadrado_erosion,'Enable','on');
%set(handles.Erosion_linea,'Enable','on');
%set(handles.Erosion_rectangulo,'Enable','on');
set(handles.Dilatacion_cuadrado,'Enable','on');
%set(handles.Dilatacion_linea,'Enable','on');
%set(handles.Dilatacion_rectangulo,'Enable','on');
set(handles.Apertura_cuadrado,'Enable','on');
%set(handles.Apertura_linea,'Enable','on');
%set(handles.Apertura_rectangulo,'Enable','on');
set(handles.Clausura_cuadrado,'Enable','on');
%set(handles.Clausura_linea,'Enable','on');
%set(handles.Clausura_rectangulo,'Enable','on');

% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Clausura_cuadrado.
function Clausura_cuadrado_Callback(hObject, eventdata, handles)
%global img
valorE=get(handles.S,'Value');
Img = handles.img;
imgCopy = Img;
%umbral= graythresh(imgCopy);
%imag_bw=im2bw(imgCopy,umbral);
%imag_bw= 1-imag_bw;
cuadrado = strel('square',valorE);
imag_Claus_cuadrado=imclose(imgCopy,cuadrado);
Img=imag_Claus_cuadrado;
subplot(handles.axPro),imshow(Img);

% hObject    handle to Clausura_cuadrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Clausura_linea.
%function Clausura_linea_Callback(hObject, eventdata, handles)
%Img = handles.img;
%imgCopy = Img;
%umbral= graythresh(imgCopy);
%imag_bw=im2bw(imgCopy,umbral);
%imag_bw= 1-imag_bw;
%linea = strel('line',4,45);
%imag_Claus_linea=imclose(imag_bw,linea);
%Img=imag_Claus_linea;
%subplot(handles.axPro),imshow(Img);

% hObject    handle to Clausura_linea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Clausura_rectangulo.
%function Clausura_rectangulo_Callback(hObject, eventdata, handles)
%Img = handles.img;
%imgCopy = Img;
%umbral= graythresh(imgCopy);
%imag_bw=im2bw(imgCopy,umbral);
%imag_bw= 1-imag_bw;
%rectangulo = strel('rectangle',[2 3]);
%imag_Claus_rectangulo=imclose(imag_bw,rectangulo);
%Img=imag_Claus_rectangulo;
%subplot(handles.axPro),imshow(Img);

% hObject    handle to Clausura_rectangulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Apertura_cuadrado.
function Apertura_cuadrado_Callback(hObject, eventdata, handles)
%global img
valorE=get(handles.S,'Value');
Img = handles.img;
imgCopy = Img;
%umbral= graythresh(imgCopy);
%imag_bw=im2bw(imgCopy,umbral);
%imag_bw= 1-imag_bw;
cuadrado = strel('square',valorE);
imag_Aper_cuadrado=imopen(imgCopy,cuadrado);
Img=imag_Aper_cuadrado;
subplot(handles.axPro),imshow(Img);

% hObject    handle to Apertura_cuadrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Apertura_linea.
function Apertura_linea_Callback(hObject, eventdata, handles)
Img = handles.img;
imgCopy = Img;
umbral= graythresh(imgCopy);
imag_bw=im2bw(imgCopy,umbral);
imag_bw= 1-imag_bw;
linea = strel('line',4,45);
imag_Aper_linea=imopen(imag_bw,linea);
Img=imag_Aper_linea;
subplot(handles.axPro),imshow(Img);

% hObject    handle to Apertura_linea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Apertura_rectangulo.
function Apertura_rectangulo_Callback(hObject, eventdata, handles)
Img = handles.img;
imgCopy = Img;
umbral= graythresh(imgCopy);
imag_bw=im2bw(imgCopy,umbral);
imag_bw= 1-imag_bw;
rectangulo = strel('rectangle',[2 3]);
imag_Aper_rectangulo=imopen(imag_bw,rectangulo);
Img=imag_Aper_rectangulo;
subplot(handles.axPro),imshow(Img);

% hObject    handle to Apertura_rectangulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Dilatacion_cuadrado.
function Dilatacion_cuadrado_Callback(hObject, eventdata, handles)
%global img
valorE=get(handles.S,'Value');
Img = handles.img;
imgCopy = Img;
%umbral= graythresh(imgCopy);
%imag_bw=im2bw(imgCopy,umbral);
%imag_bw= 1-imag_bw;
cuadrado = strel('square',valorE);
imag_dilata_cuadrado=imdilate(imgCopy,cuadrado);
Img=imag_dilata_cuadrado;
subplot(handles.axPro),imshow(Img);
% hObject    handle to Dilatacion_cuadrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Dilatacion_linea.
%function Dilatacion_linea_Callback(hObject, eventdata, handles)


% hObject    handle to Dilatacion_linea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Dilatacion_rectangulo.
function Dilatacion_rectangulo_Callback(hObject, eventdata, handles)
Img = handles.img;
imgCopy = Img;
umbral= graythresh(imgCopy);
imag_bw=im2bw(imgCopy,umbral);
imag_bw= 1-imag_bw;
rectangulo = strel('rectangle',[2 3]);
imag_dila_rectangulo=imdilate(imag_bw,rectangulo);
Img=imag_dila_rectangulo;
subplot(handles.axPro),imshow(Img);
% hObject    handle to Dilatacion_rectangulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Cuadrado_erosion.
function Cuadrado_erosion_Callback(hObject, eventdata, handles)
%global img
%cont = 1;
valorE=get(handles.S,'Value');
Img = handles.img;
imgCopy = Img;
%umbral= graythresh(imgCopy);
%imag_bw=im2bw(imgCopy,umbral);
%imag_bw= 1-imag_bw;
cuadrado = strel('square',valorE);
imag_erode_cuadrado=imerode(imgCopy,cuadrado);
Img=imag_erode_cuadrado;
subplot(handles.axPro),imshow(Img)

% hObject    handle to Cuadrado_erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Erosion_linea.
function Erosion_linea_Callback(hObject, eventdata, handles)
Img = handles.img;
imgCopy = Img;
umbral= graythresh(imgCopy);
imag_bw=im2bw(imgCopy,umbral);
imag_bw= 1-imag_bw;
linea = strel('line',4,45);
imag_erode_linea=imerode(imag_bw,linea);
Img=imag_erode_linea;
subplot(handles.axPro),imshow(Img);

% hObject    handle to Erosion_linea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Erosion_rectangulo.
function Erosion_rectangulo_Callback(hObject, eventdata, handles)
Img = handles.img;
imgCopy = Img;
Matrix_B = Img;
umbral= graythresh(Matrix_B);
imag_bw=im2bw(Matrix_B,umbral);
imag_bw= 1-imag_bw;
rectangulo = strel('rectangle',[2 3]);
imag_erode_rectangulo=imerode(imag_bw,rectangulo);
Img=imag_erode_rectangulo;
subplot(handles.axPro),imshow(Img);
% hObject    handle to Erosion_rectangulo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Ayuda_Callback(hObject, eventdata, handles)
% hObject    handle to Ayuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axOriginal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axOriginal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axOriginal


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
valor=get(hObject,'Value');

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function S_Callback(hObject, eventdata, handles)
valor=get(handles.S,'Value');
set(handles.text5,'String',valor);


% --- Executes during object creation, after setting all properties.
function S_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in aplicar.
function aplicar_Callback(hObject, eventdata, handles)
 
% global mapa

imge = getimage(handles.axPro);
imgCop = getimage(handles.axOriginal);
handles.imgCopia=imgCop;
subplot(handles.axOriginal),imshow(imge);
handles.img=imge;
guidata(hObject,handles);
%set(handles.Cuadrado_erosion,'Enable','on');
%set(handles.Dilatacion_cuadrado,'Enable','on');
%set(handles.Apertura_cuadrado,'Enable','on');
%set(handles.Clausura_cuadrado,'Enable','on');
%[imagen,mapa]=imread(fullfile(dire,nombre));
%axes(handles.axOriginal)
%imshow(imagen,mapa)

% hObject    handle to aplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dh.
function dh_Callback(hObject, eventdata, handles)
%imgCopia = getimage(handles.axOriginal);
mg = handles.imgCopia;
subplot(handles.axOriginal),imshow(mg);
handles.img=mg;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I2= imread('wind.jpg');
image(I2);
axis off
% Hint: place code in OpeningFcn to populate axes3
