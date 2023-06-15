function varargout = Collage(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Collage_OpeningFcn, ...
                   'gui_OutputFcn',  @Collage_OutputFcn, ...
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


% --- Executes just before Collage is made visible.
function Collage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Collage (see VARARGIN)

% Choose default command line output for Collage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Collage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Collage_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in collageButton.
function collageButton_Callback(hObject, eventdata, handles)
       
    global imagenes;

    [archivos, ruta] = uigetfile('*.jpg', 'Seleccionar imágenes', 'MultiSelect', 'on');
    

    if isequal(archivos, 0)
 
        return;
    end
    

    imagenes = cell(length(archivos), 1);
    
    for i = 1:length(archivos)
        imagen = imread(fullfile(ruta, archivos{i}));
        imagenes{i} = imagen;
    end    
  
    collage = createCollage(imagenes); 
    
    axes(handles.axesCollage);
    imshow(collage);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in saveImagen.
function saveImagen_Callback(hObject, eventdata, handles)
save = getimage(handles.axesCollage);
if save == 0
    return
end
formatos = {'*.jpg;*.tif;*.bmp;*.ppm;*.mdl'};
[nomb,ruta] = uiputfile(formatos,'Magia imagen');
if nomb == 0,return,end
fName = fullfile(ruta,nomb);
imwrite(save,fName);
msgbox('LA IMAGEN SE HA GUARDADO CON EXITO!');



% --- Executes on button press in regMenuPrinc.
function regMenuPrinc_Callback(hObject, eventdata, handles)
close(Collage);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
