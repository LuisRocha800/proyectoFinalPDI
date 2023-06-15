function varargout = Ecualizacion(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ecualizacion_OpeningFcn, ...
                   'gui_OutputFcn',  @Ecualizacion_OutputFcn, ...
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


% --- Executes just before Ecualizacion is made visible.
function Ecualizacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ecualizacion (see VARARGIN)
global imagen
global mapa
axes(handles.img_ent);
imshow(imagen,mapa);
handles.img=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);

% Choose default command line output for Ecualizacion
handles.output = hObject;
set(gcf,'Color',[.10,.09,.23])
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ecualizacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ecualizacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function pbHNormal_Callback(hObject, eventdata, handles)


Ir = imread('');


[cont,x] = imhist(Ir);
axes(handles.img_ent), subplot(2,2,1), imshow(Ir); title('Imagen Sin Ecualizar'),
                     subplot(2,2,2), imhist(Ir); title('Histograma Original'),
     
function pbHEcualizado_Callback(hObject, eventdata, handles)
% opc = get(handles.rotar,'Value');

 
  [Filtro,Directorio] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl','Abrir','Ver Imagenes en Directorio por Defecto.');
  ITG = imread(Filtro);
  %IOR = imread('Imagen3.jpg');
  
  [cont, x] = imhist(ITG);
   [mE,nE] = size(ITG);
   va = 0;
   
 for v = 1: 256
    H(v) = va+cont(v);
      va = H(v);
end
    for i = 1: mE
       for j = 1: nE
              Acum = ITG(i,j);
         ImpE(i,j) = H(Acum+1)*(255/(mE*nE));
       end
   end
   
   
     axes(handles.axes2), 
     imshow(ImpE),  title('Imagen Transformada');
    guidata(hObject,handles);
    
    axes(handles.axes5), 
     imhist(ImpE),  title('Histograma Ecualizado');
    guidata(hObject,handles);
    


% --- Executes on button press in equal_ima.
function equal_ima_Callback(hObject, eventdata, handles)
% hObject    handle to equal_ima (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen;
global mapa;

[nombre,dire,indx] = uigetfile('*.jpg;*.tif;*.bmp;*.ppm;*.mdl','Abrir');
if nombre==0
    return
end

[imagen,mapa]=imread(fullfile(dire,nombre));
axes(handles.img_ent);
imshow(imagen,mapa);
handles.img=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);

 

% --- Executes on button press in btnEcualizar.
function btnEcualizar_Callback(hObject, eventdata, handles)
% hObject    handle to btnEcualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imagen=handles.img;

  [cont, x] = imhist(imagen);
   [mE,nE] = size(imagen);
   va = 0;
   
 for v = 1: 256
    H(v) = va+cont(v);
      va = H(v);
end
    for i = 1: mE
       for j = 1: nE
              Acum = imagen(i,j);
         imagen(i,j) = H(Acum+1)*(255/(mE*nE));
       end
   end
   
    axes(handles.axes2), 
    imshow(imagen);
    guidata(hObject,handles);
    
    axes(handles.axes5), 
    imhist(imagen);
    guidata(hObject,handles);
    handles.imgRo=imagen;
    handles.img= imagen;
    

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Portada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Portada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
I2= imread('know.jpg');
image(I2);
axis off
% Hint: place code in OpeningFcn to populate Portada


% --- Executes on button press in guardarEcualizacion.
function guardarEcualizacion_Callback(hObject, eventdata, handles)
% hObject    handle to guardarEcualizacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save = getimage(handles.axes2);
if save == 0
    return
end
formatos = {'*.jpg;*.tif;*.bmp;*.ppm;*.mdl'};
[nomb,ruta] = uiputfile(formatos,'Magia imagen');
if nomb == 0,return,end
fName = fullfile(ruta,nomb);
imwrite(save,fName);
msgbox('Se ha guardado con exito!');


% --- Executes on button press in Menu.
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global imagen

imagen=getimage(handles.axes2);
close(Ecualizacion);
%Partes1y2


% --- Executes on button press in btnHistograma.
function btnHistograma_Callback(hObject, eventdata, handles)
% hObject    handle to btnHistograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imagen=handles.img;
axes(handles.histogramaOrginal);
imhist(imagen);
handles.imgRo=imagen;

guidata(hObject,handles);


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
