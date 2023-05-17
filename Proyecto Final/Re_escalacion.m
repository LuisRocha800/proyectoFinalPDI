function varargout = Re_escalacion(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Re_escalacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Re_escalacion_OutputFcn, ...
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


% --- Executes just before Re_escalacion is made visible.
function Re_escalacion_OpeningFcn(hObject, eventdata, handles, varargin)
global imagen
global mapa
axes(handles.axes1)
imshow(imagen,mapa)
[m,n] = size(imagen);
set(handles.anchoO,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoO,'string',strcat('Altura: ',num2str(n)));
set(handles.anchoP,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoP,'string',strcat('Altura: ',num2str(n)));
handles.img=imagen;
handles.map=mapa;
handles.imgRe=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);
axes(handles.axes2)
imshow(imagen,mapa)
%set(handles.btnGuarda,'Enable','on');
set(handles.S,'Min',1,'Max',201,'Value',1,'SliderStep',[0.005 0.10]);
handles.s=get(handles.S,'Value')
set(handles.text2,'String',handles.s);
guidata(hObject,handles);
handles.output = hObject;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Re_escalacion (see VARARGIN)

% Choose default command line output for Re_escalacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Re_escalacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Re_escalacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in abrir.
function abrir_Callback(hObject, eventdata, handles)
[nombre,dire,indx] = uigetfile( ...
{'*.jpg;*.tif;*.bmp;*.ppm;*.mdl'}, ...
   'Abrir');
if nombre==0
    return
end
[imagen,mapa]=imread(fullfile(dire,nombre));
axes(handles.axes1)
imshow(imagen,mapa)
[m,n] = size(imagen);
set(handles.anchoO,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoO,'string',strcat('Altura: ',num2str(n)));
set(handles.anchoP,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoP,'string',strcat('Altura: ',num2str(n)));
handles.img=imagen;
handles.map=mapa;
handles.imgRe=imagen;
guidata(hObject,handles);
axes(handles.axes2)
imshow(imagen,mapa)
%set(handles.btnGuardar,'Enable','on');


% --- Executes on button press in dh.
function dh_Callback(hObject, eventdata, handles)
mg = handles.imgCopia;
subplot(handles.axes1),imshow(mg);
handles.img=mg;
[m,n] = size(mg);
set(handles.anchoO,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoO,'string',strcat('Altura: ',num2str(n)));
guidata(hObject,handles);


% --- Executes on button press in aplicar.
function aplicar_Callback(hObject, eventdata, handles)
imge = getimage(handles.axes2);
imgCop = getimage(handles.axes1);
handles.imgCopia=imgCop;
subplot(handles.axes1),imshow(imge);
handles.img=imge;
[m,n] = size(imge);
set(handles.anchoO,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoO,'string',strcat('Altura: ',num2str(n)));
guidata(hObject,handles);


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
msgbox('Se ha guardado con exito!');


% --- Executes on button press in menu.
function menu_Callback(hObject, eventdata, handles)
global imagen
imagen=handles.img;
close(Re_escalacion);
Menu_Principal
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function S_Callback(hObject, eventdata, handles)
valor=get(handles.S,'Value');
set(handles.text2,'String',valor);
imagen=handles.img;
%val=get(handles.sliRe_escala,'Value');
if(valor>0)
%set(handles.txtRe_escala,'string',valor*100);
valor=str2double(get(handles.text2,'string'))/100;
imagen= imresize(imagen,valor);
axes(handles.axes2);
imshow(imagen)
[m,n] = size(imagen);
set(handles.anchoP,'string',strcat('Ancho: ',num2str(m)));
set(handles.altoP,'string',strcat('Altura: ',num2str(n)));
handles.imgRe =imagen;
guidata(hObject,handles);
else
   f = warndlg('Valor excedido','Warning');
end

% hObject    handle to S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function S_CreateFcn(hObject, eventdata, handles)
% hObject    handle to S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
