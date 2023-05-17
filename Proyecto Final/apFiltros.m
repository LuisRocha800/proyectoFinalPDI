function varargout = apFiltros(varargin)
% APFILTROS MATLAB code for apFiltros.fig
%      APFILTROS, by itself, creates a new APFILTROS or raises the existing
%      singleton*.
%
%      H = APFILTROS returns the handle to a new APFILTROS or the handle to
%      the existing singleton*.
%
%      APFILTROS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APFILTROS.M with the given input arguments.
%
%      APFILTROS('Property','Value',...) creates a new APFILTROS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before apFiltros_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to apFiltros_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help apFiltros

% Last Modified by GUIDE v2.5 10-Jun-2021 17:01:25

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
handles.imgCopia=imagen;
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
       disp('Directorio mal Ubicado')
       reAbrir = fullfile(directory,format);
       
        
end


% -- Este ComboBox Sirve para APLICAR cualquier Filtro
function pumFiltros_Callback(hObject, eventdata, handles)
global Directorio;
global auxF;


op = get(handles.pumFiltros,'Value');

switch (op)          
        case 2
            %Ap. el Filtro de la media
               %IN = imread(Directorio); 
         %E_GRISES = rgb2gray(IN);
         %Infectanto artificialmente con sal y pimienta
              Img = handles.img;
              imgCopy = Img;
               %cSP = imnoise(Img,'salt & pepper',0.15); %Contaminando Imagen
               axes(handles.axes1);
               imshow(Img);
               guidata(hObject,handles);
           %Imagen ya limpiada con el filtro de la mediana
                aFM = fspecial('average');
              dFMed = imfilter(Img,aFM);
               axes(handles.axes5); 
              imshow(dFMed);
              guidata(hObject,handles);
    
        case 3 
            Img = handles.img;
              imgCopy = Img;
               %cSP = imnoise(Img,'salt & pepper',0.15); %Contaminando Imagen
               axes(handles.axes1);
               imshow(Img);
               guidata(hObject,handles);
           %Imagen ya limpiada con el filtro de la mediana
              IFMedn = medfilt2(Img);
               axes(handles.axes5); 
              imshow(IFMedn);
              guidata(hObject,handles);
              
        case 4
            Img = handles.img;
              imgCopy = Img;
               %cSP = imnoise(Img,'salt & pepper',0.15); %Contaminando Imagen
               axes(handles.axes1);
               imshow(Img);
               guidata(hObject,handles);
         
               IPWF = edge(Img,'prewitt');
               axes(handles.axes5); 
              imshow(IPWF);
              guidata(hObject,handles);;
              
        
        case 5 
          Img = handles.img;
              imgCopy = Img;
               %cSP = imnoise(Img,'salt & pepper',0.15); %Contaminando Imagen
               axes(handles.axes1);
               imshow(Img);
               guidata(hObject,handles);
         
              ISWF = edge(Img,'sobel');
               axes(handles.axes5); 
              imshow(ISWF);
              guidata(hObject,handles);
         
        case 6
             Img = handles.img;
              imgCopy = Img;
               %cSP = imnoise(Img,'salt & pepper',0.15); %Contaminando Imagen
               axes(handles.axes1);
               imshow(Img);
               guidata(hObject,handles);
          
              IRWF = edge(Img,'roberts');
               axes(handles.axes5); 
              imshow(IRWF);
              guidata(hObject,handles);
        otherwise
              disp('Opción no valida');
end
          
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
msgbox('¡Imagen guardada con exito!');


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
