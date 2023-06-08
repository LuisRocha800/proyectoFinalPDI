function varargout = apFiltros(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @apFiltros_OpeningFcn, ...
                   'gui_OutputFcn',  @apFiltros_OutputFcn, ...
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


% --- Executes just before apFiltros is made visible.
function apFiltros_OpeningFcn(hObject, eventdata, handles, varargin)
global imagen
global mapa
axes(handles.axes1)
imshow(imagen,mapa)
axes(handles.axes5)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
%handles.imgRe=imagen;
%handles.imgCopia=imagen;
guidata(hObject,handles);

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to apFiltros (see VARARGIN)

% Choose default command line output for apFiltros
handles.output = hObject;

% Update handles structure
 set(gcf,'Color',[.20,.40,.60]);
guidata(hObject, handles);

% UIWAIT makes apFiltros wait for user response (see UIRESUME)
% uiwait(handles.pumContornos);


% --- Outputs from this function are returned to the command line.
function varargout = apFiltros_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function cargarImagen()
global reAbrir
 [format,directory] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl','Abrir');
                            MI = imread(Directorio);
                     axes(handles.axes1), subplot(1,2,1), imshow(MI);
   if (format ~= 0)
       disp('EL DIRECTORIO NO EXISTE')
       reAbrir = fullfile(directory,format);
       
        
end

function filtroMedia_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;

%op = get(handles.pumFiltros,'Value');

% Código a ejecutar al presionar el botón
       
    Img = handles.img;
    imgCopy = handles.imgGriss;

    axes(handles.axes1);
    imshow(Img);
    guidata(hObject,handles);
% Convertir la imagen a escala de grises si es necesario
%imagen_grises = rgb2gray(imgCopy);
% Definir el tamaño del filtro de media
tamFiltro = 5;
% Aplicar el filtro de media
imgfiltro = imfilter(imgCopy, ones(tamFiltro) / tamFiltro^2);
axes(handles.axes5);
imshow(imgfiltro);
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function pumFiltros_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pumFiltros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pumContor.
function pumContor_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function pumContor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pumContor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pumBordes.
% function pumBordes_Callback(hObject, eventdata, handles)
% %global directory;
% 
% optEdge = get(handles.pumBordes,'Value');
%  
%  switch (optEdge)    
%      
%       
%           %     [gR ,t3]  = edge(cEG_R,mRV);
%          
%      otherwise
%              disp('ERRROR: opción incorrecta');
%          
%  end
%  

% --- Executes during object creation, after setting all properties.
function pumBordes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pumBordes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Portada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Portada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I2= imread('filt.jpg');
image(I2);
axis off
% Hint: place code in OpeningFcn to populate Portada


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in deshecer.
function deshecer_Callback(hObject, eventdata, handles)
mg = handles.imgCopia;
subplot(handles.axes1),imshow(mg);
handles.img=mg;
guidata(hObject,handles);

% hObject    handle to deshecer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% save = getimage(handles.axes1);
% if save == 0
%     return
% end
% formatos = {'*.jpg;*.bmp;*.tif'};
% [nomb,ruta] = uiputfile(formatos,'Magia imagen');
% if nomb == 0,return,end
% fName = fullfile(ruta,nomb);
% imwrite(save,fName);
% msgbox('Se ha guardado con exito!');



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save = getimage(handles.axes5);
if save == 0
    return
end
formatos = {'*.jpg;*.bmp;*.tif'};
[nomb,ruta] = uiputfile(formatos,'Magia imagen');
if nomb == 0,return,end
fName = fullfile(ruta,nomb);
imwrite(save,fName);
msgbox('¡LA IMAGEN FUE GUARDADA CON EXITO!');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global imagen
imagen=handles.img;
close(apFiltros);
Menu_Principal


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
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
axes(handles.axes1)
imshow(imagen,mapa)
axes(handles.axes5)
imshow(imagen,mapa)
handles.img=imagen;
handles.imgCopia=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
guidata(hObject,handles);


% --- Executes on button press in APLICAR.
function APLICAR_Callback(hObject, eventdata, handles)

imge = getimage(handles.axes5);
imgCop = getimage(handles.axes1);
handles.imgCopia=imgCop;
subplot(handles.axes1),imshow(imge);
handles.img=imge;
guidata(hObject,handles);

% hObject    handle to APLICAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in filtroCaja.
function filtroCaja_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;

%op = get(handles.pumFiltros,'Value');

% Código a ejecutar al presionar el botón
       
    Img = handles.img;
    imgCopy = handles.imgGriss;

    axes(handles.axes1);
    imshow(Img);
    guidata(hObject,handles);
% Convertir la imagen a escala de grises si es necesario
%imggris = rgb2gray(imgCopy);
% Definir el tamaño del filtro de media
tamFiltroCaja = 3;
% Aplicar el filtro de media
imgFitroCaja = imboxfilt(imgCopy, tamFiltroCaja);
axes(handles.axes5);
imshow(imgFitroCaja);
guidata(hObject,handles);


% --- Executes on button press in filtGaussiano.
function filtGaussiano_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;

% Código a ejecutar al presionar el botón
       
    Img = handles.img;
    imgCopy = handles.imgGriss;

    axes(handles.axes1);
    imshow(Img);
    guidata(hObject,handles);
sigma = 2;
% Aplicar el filtro de media
imgFitroGaussiano = imgaussfilt(imgCopy, sigma);
handles.imgFitroGaussiano = imgFitroGaussiano;
axes(handles.axes5);
imshow(imgFitroGaussiano);
guidata(hObject,handles);


% --- Executes on button press in limpimgBorr.
function limpimgBorr_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;

Img = handles.img;
axes(handles.axes5);
imshow(Img);
guidata(hObject,handles);


% --- Executes on button press in escalagrisesConv.
function escalagrisesConv_Callback(hObject, eventdata, handles)
Img = handles.img;
imgCopy = Img;
% Convertir la imagen a escala de grises si es necesario
imgGriss = rgb2gray(imgCopy);
handles.imgGriss = imgGriss;
axes(handles.axes5);
imshow(imgGriss);
guidata(hObject,handles);


% --- Executes on button press in rgb.
function rgb_Callback(hObject, eventdata, handles)


% --- Executes on button press in filtMediana.
function filtMediana_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;
       
    imgCopy = handles.imgGriss;

    filt = medfilt2(imgCopy, [3, 3]);
    axes(handles.axes5);
imshow(filt);
guidata(hObject,handles);

% --- Executes on button press in filtModa.
function filtModa_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;
       
    imgCopy = handles.imgGriss;

tamWindow = 3;
[rows, cols] = size(imgCopy);

fimagen = zeros(rows, cols);

% Aplicar el filtro de moda
for i = 1:rows
    for j = 1:cols
        % Obtener la ventana alrededor del píxel actual
        row_start = max(1, i - floor(tamWindow/2));
        row_end = min(rows, i + floor(tamWindow/2));
        col_start = max(1, j - floor(tamWindow/2));
        col_end = min(cols, j + floor(tamWindow/2));
        window = imgCopy(row_start:row_end, col_start:col_end);
        
        % Calcular la moda de la ventana
        window_vector = window(:);
        mode_value = mode(window_vector);
        
        % Asignar el valor de la moda al píxel actual en la imagen filtrada
        fimagen(i, j) = mode_value;
    end
end
axes(handles.axes5);
imshow(fimagen, []);
guidata(hObject,handles);


% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)

global Directorio;
global auxF;
       
    imgCopy = handles.imgGriss;

    % Aplicar el filtro de Prewitt
filtro_x = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
filtro_y = [-1, -1, -1; 0, 0, 0; 1, 1, 1];

imgPrewittX = imfilter(double(imgCopy), filtro_x);
imgPrewittY = imfilter(double(imgCopy), filtro_y);

% Calcular la magnitud de los gradientes
magnitud_gradiente = sqrt(imgPrewittX.^2 + imgPrewittY.^2);

axes(handles.axes5);
imshow(imgPrewittX);
guidata(hObject,handles);


% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)

global Directorio;
global auxF;
       
    imgCopy = handles.imgGriss;

    filtroXSobel = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
    filtroYSobel = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

imgSobelX = imfilter(double(imgCopy), filtroXSobel);
imgSobelY = imfilter(double(imgCopy), filtroYSobel);

% Calcular la magnitud de los gradientes
mgCrecSobel = sqrt(imgSobelX.^2 + imgSobelY.^2);


axes(handles.axes5);
imshow(imgSobelX);
guidata(hObject,handles);


% --- Executes on button press in roberts.
function roberts_Callback(hObject, eventdata, handles)

global Directorio;
global auxF;
       
    imgCopy = handles.imgGriss;

    filtroXRoberts = [1, 0; 0, -1];
    filtroYRoberts = [0, 1; -1, 0];

imgRobertsX = imfilter(double(imgCopy), filtroXRoberts);
imgRobertsY = imfilter(double(imgCopy), filtroYRoberts);

% Calcular la magnitud de los gradientes
mgCrecRoberts = sqrt(imgRobertsX.^2 + imgRobertsY.^2);


axes(handles.axes5);
imshow(imgRobertsX);
guidata(hObject,handles);
