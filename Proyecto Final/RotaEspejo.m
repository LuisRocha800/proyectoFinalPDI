function varargout = RotaEspejo(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RotaEspejo_OpeningFcn, ...
                   'gui_OutputFcn',  @RotaEspejo_OutputFcn, ...
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

function RotaEspejo_OpeningFcn(hObject, eventdata, handles, varargin)
global imagen
global mapa
axes(handles.axes1)
imshow(imagen,mapa)
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);

handles.output = hObject;

guidata(hObject, handles);

function varargout = RotaEspejo_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function pushbutton3_Callback(hObject, eventdata, handles)

imagen=handles.img;
mapa=handles.map;
l1=fliplr(imagen);
l2=flipud(imagen);
l3=fliplr(l2);
imagen=[l2 l3;imagen l1];
imagen= imresize(imagen,.5);
axes(handles.axes2);
imshow(imagen,mapa)
handles.imgRo=imagen;
guidata(hObject,handles);

function Abrir_Callback(hObject, eventdata, handles)
[nombre,dire,indx] = uigetfile( ...
{'*.jpg;*.tif;*.bmp;*.ppm;*.mdl'}, ...
   'Abrir');
if nombre==0
    return
end
[imagen,mapa]=imread(fullfile(dire,nombre));
axes(handles.axes1)
imshow(imagen,mapa)
axes(handles.axes2)
imshow(imagen,mapa)
handles.img=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);

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
msgbox('Se ha guardado con exito!');

function menu_Callback(hObject, eventdata, handles)
global imagen
imagen=handles.img;
close(RotaEspejo);
Menu_Principal

function Rot_izquierda_Callback(hObject, eventdata, handles)
imagen=handles.img;
mapa=handles.map;
mult=handles.mult;
if mult>315
    mult=0;
end
mult=mult+45;
imagen = imrotate(imagen,mult);
axes(handles.axes2);
imshow(imagen,mapa)
handles.mult=mult;
handles.imgRo=imagen;
guidata(hObject,handles);

function Rot_Derecha_Callback(hObject, eventdata, handles)
imagen=handles.img;
mapa=handles.map;
mult=handles.mult;
if mult>315
    mult=0;
end
mult=mult-45;
imagen = imrotate(imagen,mult);
axes(handles.axes2);
imshow(imagen,mapa)
handles.mult=mult;
handles.imgRo=imagen;
guidata(hObject,handles);

function figure1_ButtonDownFcn(hObject, eventdata, handles)

function dh_Callback(hObject, eventdata, handles)
mg = handles.imgCopia;
subplot(handles.axes1),imshow(mg);
handles.img=mg;
guidata(hObject,handles);

function aplicar_Callback(hObject, eventdata, handles)
imge = getimage(handles.axes2);
imgCop = getimage(handles.axes1);
handles.imgCopia=imgCop;
subplot(handles.axes1),imshow(imge);
handles.img=imge;
guidata(hObject,handles);

function axes3_CreateFcn(hObject, eventdata, handles)
I2= imread('mirror.jpg');
image(I2);
axis off



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


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
