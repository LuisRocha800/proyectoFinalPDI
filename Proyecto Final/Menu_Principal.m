function varargout = Menu_Principal(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Menu_Principal_OpeningFcn, ...
                   'gui_OutputFcn',  @Menu_Principal_OutputFcn, ...
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

function Menu_Principal_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for Menu_Principal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Menu_Principal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Menu_Principal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reescalacion.
function reescalacion_Callback(hObject, eventdata, handles)
Re_escalacion
% hObject    handle to reescalacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in opbasicas.
function opbasicas_Callback(hObject, eventdata, handles)
% hObject    handle to opbasicas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in collage.
function collage_Callback(hObject, eventdata, handles)
% hObject    handle to collage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
collage1

% --- Executes on button press in opmorfologicas.
function opmorfologicas_Callback(hObject, eventdata, handles)
%close(Operaciones_Morfologicas);
Operaciones_Morfologicas
% hObject    handle to opmorfologicas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in filtros.
function filtros_Callback(hObject, eventdata, handles)
% hObject    handle to filtros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
apFiltros

% --- Executes on button press in rotacionyespejo.
function rotacionyespejo_Callback(hObject, eventdata, handles)
RotaEspejo
% hObject    handle to rotacionyespejo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
save = getimage(handles.axes2);
if save == 0
    return
end
formatos = {'*.jpg;*.bmp;*.tif'};
[nomb,ruta] = uiputfile(formatos,'Magia imagen');
if nomb == 0,return,end
fName = fullfile(ruta,nomb);
imwrite(save,fName);
msgbox('¡LA IMAGEN FUE GUARDADA CON EXITO!');


% --- Executes on button press in deshacer.
function deshacer_Callback(hObject, eventdata, handles)
global imagen
global Directorio

imgorig = handles.imgCopia;
subplot(handles.axes2),imshow(imgorig);
%imagen=mg;
guidata(hObject,handles);


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
global nombre
global imagen
global mapa
%global img
[nombre,dire,indx] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl','Abrir');
if nombre==0
    return
end
[imagen,mapa]=imread(fullfile(dire,nombre));
[imagenO,mapaO]=imread(fullfile(dire,nombre));
axes(handles.axes1)
imshow(imagenO,mapaO)
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.imgCopia=imagen;
handles.map=mapa;
%handles.mu
lt=0;
guidata(hObject,handles);

% hObject    handle to abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in actualizar.
function actualizar_Callback(hObject, eventdata, handles)
global imagen
global mapa
imgCop = getimage(handles.axes2);
handles.imgCopia=imgCop;
axes(handles.axes2)
imshow(imagen,mapa)
guidata(hObject,handles);
% hObject    handle to actualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function tam_Callback(hObject, eventdata, handles)
% hObject    handle to tam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
updateAxes1(handles);
guidata(hObject,handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function tam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function largo_Callback(hObject, eventdata, handles)
% hObject    handle to largo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of largo as text
%        str2double(get(hObject,'String')) returns contents of largo as a double


% --- Executes during object creation, after setting all properties.
function largo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to largo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ancho_Callback(hObject, eventdata, handles)
% hObject    handle to ancho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ancho as text
%        str2double(get(hObject,'String')) returns contents of ancho as a double


% --- Executes during object creation, after setting all properties.
function ancho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ancho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Redim.
function Redim_Callback(hObject, eventdata, handles)
% hObject    handle to Redim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen
global mapa
updateAxes(handles);
guidata(hObject,handles);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ecualizacion;


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inv_fot(handles);
guidata(hObject,handles);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inv_bin(handles);
guidata(hObject,handles);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ad_img(handles);
guidata(hObject,handles);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sus_img(handles);
guidata(hObject,handles);

function updateAxes(handles)
global imagen
global mapa
imagen = getimage(handles.axes1);
if imagen == 0
    return
end
r= get(handles.ancho,'String');
c= get(handles.largo,'String');
row= str2double(r);
colum= str2double(c);
imagen= imresize(imagen,[row colum]);
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;
%handles.imgRo=imagen;

function updateAxes1(handles)
global imagen
global mapa
imagen = getimage(handles.axes1);
if imagen == 0
    return
end
v1= get(handles.tam,'Value');
imagen= imresize(imagen,v1,'bilinear');
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;

function inv_bin(handles)
global nombre
global imagen
global mapa
imagen = getimage(handles.axes2);
if imagen == 0
    return
end
imagen= imcomplement(imagen);
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;

function inv_fot(handles)
global nombre
global imagen
global mapa
imagen = getimage(handles.axes2);
if imagen == 0
    return
end
imagen= 255-imagen;
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;

function ad_img(handles)
global nombre
global imagen
global mapa
imagen = getimage(handles.axes2);
if imagen == 0
    return
end
[filename,pathname]=uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl','Abrir');
img2=imread(filename);
imagen= imagen + img2;
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;

function sus_img(handles)
global nombre
global imagen
global mapa
imagen = getimage(handles.axes2);
if imagen == 0
    return
end
[filename,pathname]=uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl','Abrir');
img2=imread(filename);
imagen= imagen - img2;
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;

% --- Executes during object creation, after setting all properties.
function Portada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Portada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I2= imread('ocean.jpg');
image(I2);
axis off
% Hint: place code in OpeningFcn to populate Portada


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function abrir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in escGrises.
function escGrises_Callback(hObject, eventdata, handles)
