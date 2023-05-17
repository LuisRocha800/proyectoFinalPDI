function varargout = Ecualizacion(varargin)
% ECUALIZACION MATLAB code for Ecualizacion.fig
%      ECUALIZACION, by itself, creates a new ECUALIZACION or raises the existing
%      singleton*.
%
%      H = ECUALIZACION returns the handle to a new ECUALIZACION or the handle to
%      the existing singleton*.
%
%      ECUALIZACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECUALIZACION.M with the given input arguments.
%
%      ECUALIZACION('Property','Value',...) creates a new ECUALIZACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ecualizacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ecualizacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ecualizacion

% Last Modified by GUIDE v2.5 17-Jun-2020 18:26:29

% Begin initialization code - DO NOT EDIT
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


% ---Mostrar imagen con Histograma Normal
function pbHNormal_Callback(hObject, eventdata, handles)

Ir = imread('ySFdo.jpg');


[cont,x] = imhist(Ir);
axes(handles.img_ent), subplot(2,2,1), imshow(Ir); title('Imagen Sin Ecualizar'),
                     subplot(2,2,2), imhist(Ir); title('Histograma Original'),
     
% --- Ejecuta el Histograma ya Ecualizado..
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
   
   
   
   %figure('Name','Ecualización','NumberTitle','off'), 
   
     axes(handles.axes2), 
     imshow(ImpE),  title('Img-Transformada');
    guidata(hObject,handles);
    
    axes(handles.axes5), 
     imhist(ImpE),  title('Histograma-Ecualizado');
    guidata(hObject,handles);
    
     %subplot(2,1,1), imshow(ImpE),  title('Img-Transformada'),
     %subplot(2,1,2), imhist(ImpE),  title('Histograma-Ecualizado');
%set(handles.axes2,'UserData',ImpE);


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
%imagen= rgb2gray(imagen);
%axes(handles.hist_ent);
%imhist(imagen);
%guidata(hObject,handles);

[imagen,mapa]=imread(fullfile(dire,nombre));
axes(handles.img_ent);
imshow(imagen,mapa);
handles.img=imagen;
handles.map=mapa;
handles.mult=0;
handles.imgRo=imagen;
handles.imgCopia=imagen;
guidata(hObject,handles);

 

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
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
   
   
   
   %figure('Name','Ecualización','NumberTitle','off'), 
   
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


% --- Executes on button press in save_ec.
function save_ec_Callback(hObject, eventdata, handles)
% hObject    handle to save_ec (see GCBO)
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


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imagen=handles.img;
axes(handles.hist_ent);
imhist(imagen);
handles.imgRo=imagen;

guidata(hObject,handles);
