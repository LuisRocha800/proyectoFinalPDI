function varargout = Practica_1(varargin)
% PRACTICA_1 MATLAB code for Practica_1.fig
%      PRACTICA_1, by itself, creates a new PRACTICA_1 or raises the existing
%      singleton*.
%
%      H = PRACTICA_1 returns the handle to a new PRACTICA_1 or the handle to
%      the existing singleton*.
%
%      PRACTICA_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA_1.M with the given input arguments.
%
%      PRACTICA_1('Property','Value',...) creates a new PRACTICA_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practica_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practica_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practica_1

% Last Modified by GUIDE v2.5 17-Jun-2020 13:42:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practica_1_OpeningFcn, ...
                   'gui_OutputFcn',  @Practica_1_OutputFcn, ...                   
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

% --- Executes just before Practica_1 is made visible.
function Practica_1_OpeningFcn(hObject, eventdata, handles, varargin)
  %set(handles.pnlFondo,'Visible','off');
 global imagen 
  set(handles.pnl_1,'Visible','off');
  set(handles.axes1,'Visible','off');
  set(handles.axes2,'Visible','off');

      set(handles.pnl_2,'Visible','off');
set(handles.SeisImagenes,'Visible','off'); %Inhabilita axes para desp collage.
     set(handles.imagen1,'Visible','off');
     set(handles.imagen2,'Visible','off');
     set(handles.imagen3,'Visible','off');
     set(handles.imagen4,'Visible','off');
     set(handles.imagen5,'Visible','off');
     set(handles.imagen6,'Visible','off');

%DESACTIVANDO LOS COMBO_BOX DEL PANEL1
       set(handles.cb_Vecinos,'Visible','off');
      set(handles.cb_OBasicas,'Visible','off');
    set(handles.cb_Rotaciones,'Visible','off');
      set(handles.cb_ImEspejo,'Visible','off');
      set(handles.cb_DetPicos,'Visible','off');
set(handles.cb_OpMorfologicas,'Visible','off');
    
%%%%%%%%%%%%%botones%%%%%%%%%%%%%%%%%%%
  set(handles.btnCargarEG,'Visible','off');
  set(handles.btnCargar,'Visible','off');
    
%%%%%%%%UNICO SLIDER UTILIZADO%%%%%%%%%%%%%%%%
set(handles.sdr_eEstructurante,'Visible','off');
%%%%LABELSS%%%
 set(handles.txtEE,'Visible','off');
    
%DESACTIVANDO LIST BOX DEL PANEL1
 set(handles.lb_Bordes,'Visible','off');
  %Componentes para las operaciónes de Adición y Sustracción de Imagenes
 %set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
 
 set(handles.cb_AdSus,'Visible','off');
 

 
 handles.img = imagen;

 
%set(handles.btnGpoS,'Visible','off');
handles.output = hObject;

guidata(hObject, handles);

% UIWAIT makes Practica_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Practica_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function oBasics_Callback(hObject, eventdata, handles)
  
    set(handles.cb_OBasicas,'Visible','on');
    set(handles.btnCargarEG,'Visible','on');
set(handles.btn_GuardarUniv,'Visible','on');
          set(handles.axes2,'Visible','on');
 
     set(handles.btnCargar,'Visible','off');
         set(handles.axes1,'Visible','off');
  
       set(handles.cb_Vecinos,'Visible','off');
      set(handles.cb_DetPicos,'Visible','off');
      set(handles.cb_ImEspejo,'Visible','off');
    set(handles.cb_Rotaciones,'Visible','off');
set(handles.cb_OpMorfologicas,'Visible','off');

 
set(handles.txtEE,'Visible','off');
      set(handles.lb_Bordes,'Visible','off');
      set(handles.axes1,'Visible','off');  %LABEL INST
 set(handles.sdr_eEstructurante,'Visible','off');
 
 set(handles.axes2,'Visible','on');
 set(handles.axes1,'Visible','on');
 
  set(handles.cb_AdSus,'Visible','off');
 %set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
   % set(handles.imagen1,'Visible','off');
    %set(handles.imagen2,'Visible','off');

  
 disp('Seleccionaste  el Menú Operaciónes Básicas');
 
% --------------------------------------------------------------------
function imEG_Callback(hObject, eventdata, handles)
global IU;
%    set(handles.pnl_1,'Visible','on');
%    set(handles.pnl_2,'Visible','off'); 
%    set(handles.axes1,'Visible','off');
%    set(handles.axes2,'Visible','on');
    
       EG = rgb2gray(IU);
            imshow(EG), title('Imagen: en Esc. Grises');
         axes(handles.axes2);

guidata(hObject,handles);         
     
% --------------------------------------------------------------------
function imBin_Callback(hObject, eventdata, handles)
 global IU;
%  set(handles.pnl_1,'Visible','on'); 
%  set(handles.pnl_2,'Visible','off'); 
%  set(handles.axes2,'Visible','on');
%  set(handles.axes1,'Visible','off');
       
        EG = rgb2gray(IU);
       CIB = 255-EG;   
             imshow(CIB),  title('"Imag: Inv Binaria"');
       axes(handles.axes2);
guidata(hObject,handles);         

% --------------------------------------------------------------------
function mnu_Cargar_Callback(hObject, eventdata, handles)
 set(handles.axes1,'Visible','on');
 set(handles.btnCargar,'Visible','on');
 
      set(handles.axes2,'Visible','on');  
 set(handles.btnCargarEG,'Visible','off');
 set(handles.cb_OBasicas,'Visible','off');
 set(handles.cb_ImEspejo,'Visible','off');
 
set(handles.cb_OpMorfologicas,'Visible','off');
set(handles.txtEE,'Visible','off');
 
   set(handles.lb_Bordes,'Visible','off');
   set(handles.axes1,'Visible','off');  
 set(handles.sdr_eEstructurante,'Visible','off');
 
 
 %set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
 
 set(handles.cb_AdSus,'Visible','off');
disp('Seleccionaste  el Menú Cargar Imagen');


% --------------------------------------------------------------------
function imgCollage_Callback(hObject, eventdata, handles)
  set(handles.pnlFondo,'Visible','on');
 
 set(handles.pnl_1,'Visible','off');
   set(handles.pnl_2,'Visible','on');
   
 %set(handles.axes1,'Visible','off');
 %set(handles.axes2,'Visible','off') ;  

guidata(hObject, handles);

% --------------------------------------------------------------------
function unaImagen_Callback(hObject, eventdata, handles)
   disp('activaste panel 1');
   
    set(handles.pnlFondo,'Visible','on');
   
   set(handles.pnl_2,'Visible','off');
   set(handles.pnl_1,'Visible','on');
 %guidata(hObject,handles);
 
% --------------------------------------------------------------------
function mnuFiltro_Callback(hObject, eventdata, handles)
  set(handles.cb_Vecinos,'Visible','on');
  set(handles.cb_OBasicas,'Visible','off');
  set(handles.cb_Rotaciones,'Visible','off');
  set(handles.cb_ImEspejo,'Visible','off');
  set(handles.cb_DetPicos,'Visible','off');
  set(handles.cb_OpMorfologicas,'Visible','off');
  
  set(handles.txtEE,'Visible','off');%LABEL INST
  set(handles.axes1,'Visible','off');  
   set(handles.lb_Bordes,'Visible','on');
   
   %set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
   
 
 set(handles.sdr_eEstructurante,'Visible','off');
 set(handles.cb_AdSus,'Visible','off');
disp('Seleccionaste  el Menú Filtros');

% --------------------------------------------------------------------
function vecino4_Callback(hObject, eventdata, handles)
global IU

       %IF8 = imread(a);
      h4v = [0 1 0; 1 -4 1; 0 1 0];
   FL = imfilter(IU, h4v);          
    axes(handles.axes2);
      imshow(FL), title('4 vecinos');
guidata(hObject, handles);

% --------------------------------------------------------------------
function vecino8_Callback(hObject, eventdata, handles)
global IU
 set(handles.pnl_1,'Visible','on'); 
 set(handles.pnl_2,'Visible','off'); 
 
  set(handles.axes2,'Visible','on');

      % I8 = imread(a);
      h8v = [1 1 1; 1 -8 1; 1 1 1];
   FL = imfilter(IU, h8v);          
    axes(handles.axes2);
      imshow(FL), title('8 vecinos');
guidata(hObject, handles);
      
% --------------------------------------------------------------------
function vecino4Ng_Callback(hObject, eventdata, handles)
  global IU
 set(handles.pnl_1,'Visible','on'); 
 set(handles.pnl_2,'Visible','off'); 
%set(handles.axes1,'Visible','off');
 set(handles.axes2,'Visible','on');

     %[a,b] = uigetfile('*.jpg','Cargar Img');
       %IF8 = imread(a);
      h4vN = [0 -1 0; -1 4 -1; 0 -1 0];
   FL = imfilter(IU, h4vN);          
    axes(handles.axes2);
      imshow(FL), title('4 vecinos Negativo');

guidata(hObject, handles);
% --------------------------------------------------------------------

function vecino8Ng_Callback(hObject, eventdata, handles)
 global IU
 set(handles.pnl_1,'Visible','on'); 
 set(handles.pnl_2,'Visible','off');
 set(handles.axes1,'Visible','off');
%set(handles.axes2,'Visible','on');

       %I8 = imread(a);
      h8vN = [-1 -1 -1; -1 8 -1; -1 -1 -1];
   FL = imfilter(IU, h8vN);          
    axes(handles.axes2);
      imshow(FL), title('8 vecinos Negativo');

guidata(hObject, handles);
% --------------------------------------------------------------------

function rtn1_Callback(hObject, eventdata, handles)
 set(handles.cb_Rotaciones,'Visible','on');  
 
  set(handles.cb_DetPicos,'Visible','off');
   set(handles.cb_Vecinos,'Visible','off');
  set(handles.cb_ImEspejo,'Visible','off');
  set(handles.cb_OBasicas,'Visible','off');
set(handles.cb_OpMorfologicas,'Visible','off');
 
 set(handles.txtEE,'Visible','off'); %LABEL INST
   set(handles.lb_Bordes,'Visible','off');
   set(handles.axes1,'Visible','off'); 
   
 set(handles.sdr_eEstructurante,'Visible','off');
 set(handles.cb_AdSus,'Visible','off'); 
 
%set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
   
 disp('Seleccionaste  el Menú Rotaciónes');
% --------------------------------------------------------------------
function rtn45_Callback(hObject, eventdata, handles)
 set(handles.pnl_1,'Visible','on');  global IU
 set(handles.pnl_2,'Visible','off');
 
 set(handles.axes1,'Visible','on');
 set(handles.axes2,'Visible','off');
        
 %[a,b] = uigetfile('*.jpg','Cargar Img');
       %IG = imread(a);
     
     R1 = imrotate(IU,45);
     imshow(R1), title('Rotación 45°');
     axes(handles.axes2);
     
guidata(hObject,handles);

% --------------------------------------------------------------------
function rtn90_Callback(hObject, eventdata, handles)
 global IU
 set(handles.pnl_1,'Visible','on');  
 set(handles.pnl_2,'Visible','off');
 set(handles.axes1,'Visible','on');
 set(handles.axes2,'Visible','off');
        
   %[a,b] = uigetfile('*.jpg','Cargar Img');
    %IG = imread(a);
     
     R2 = imrotate(IU,90);
          imshow(R2), title('Rotación 90°');
     axes(handles.axes2);
     
guidata(hObject,handles);

% --------------------------------------------------------------------
function rtn135_Callback(hObject, eventdata, handles)
 global IU
 set(handles.pnl_1,'Visible','on'); 
 set(handles.pnl_2,'Visible','off'); 
 set(handles.axes1,'Visible','on');
 set(handles.axes2,'Visible','off');
        
 %[a,b] = uigetfile('*.jpg','Cargar Img');
    %IG = imread(a);
     
     R3 = imrotate(IU,135);
          imshow(R3),  title('Rotación 135°');
           axes(handles.axes2);
           
guidata(hObject,handles);

function mnupnl_1_Callback(hObject, eventdata, handles)
disp('Seleccionaste  el Menú Imágenes');

% --------------------------------------------------------------------
function ima6_Callback(hObject, eventdata, handles)
  global IU
 set(handles.pnl_1,'Visible','on'); 
 set(handles.pnl_2,'Visible','off');
 set(handles.axes1,'Visible','off'); 
 set(handles.axes1,'Visible','on'); 
 
%[a,b] = uigetfile('*.jpg','Cargar Img');
    %I2 = imread(a);
    RE1 = imresize(IU,0.30);
    VI6 = [RE1 RE1; RE1 RE1; RE1 RE1];
          
    axes(handles.axes2);
        imshow(VI6), title('Matriz: Dos por Tres');
guidata(hObject, handles);

% --------------------------------------------------------------------
function ima8_Callback(hObject, eventdata, handles)
   set(handles.pnl_1,'Visible','on'); global IU
   set(handles.pnl_2,'Visible','off'); 
   set(handles.axes2,'Visible','on');
   set(handles.axes1,'Visible','off');
 
 %[a,b] = uigetfile('*.jpg','Cargar Img');
    %I8 = imread(a);
    RE2 = imresize(IU,0.40);
    VI8 = [RE2 RE2 RE2 RE2; RE2 RE2 RE2 RE2];
          
    axes(handles.axes2);
      imshow(VI8),title('Matriz: Cuatro por Dos');
guidata(hObject, handles);
    
% --------------------------------------------------------------------
function ima10_Callback(hObject, eventdata, handles)
 set(handles.pnl_1,'Visible','on');  global IU
 set(handles.pnl_2,'Visible','off');
set(handles.axes2,'Visible','on');
set(handles.axes1,'Visible','off');
 
 %[a3,b3] = uigetfile('*.jpg','Cargar Img');
     %I8 = imread(a3);
    RE3 = imresize(IU,0.40);
    VI8 = [RE3 RE3; RE3 RE3; RE3 RE3; RE3 RE3;];
          
    axes(handles.axes2);
      imshow(VI8), title('Matriz: Dos por Cinco');
  guidata(hObject, handles);

% ---Aqúí realizo evento de Collage
function btnSeisImag_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
   %collage6 = cat(1, imag1, imag2, imag3, imag4, imag5, imag6);
   VC_SI = [IU1 IU2 IU3; IU4 IU5 IU6];
      
 %APLICANDO LAS ROTACIÃ“NES MOSTRANDO COLLAGE
    axes(handles.SeisImagenes);
         imshow(VC_SI),title('Collage (6): "Dos x Tres"');
guidata(hObject,handles);

% --- Executes on button press in btnImagenes.
function btnImagenes_Callback(hObject, eventdata, handles)
  
  global formatos
            %dir = '..\Camera Roll';
        formatos = {'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'};
        LB_Titulo = 'Elija  una Imagen:  porfavor';
            
[nomImg1 direc1] = uigetfile(formatos, LB_Titulo);
[X, map]=imread(fullfile(direc1,nomImg1));
imagenE = imread(fullfile(direc1,nomImg1));

if ~isempty(map)
    imag1 = ind2rgb(X, map);                               %Transforma de Indexada a rgb
    axes(handles.imagen1);                            %Especificamos el axes
        imshow(imagen1), title('1° Imagen');                                         %Mostramos la imagen    
    set(handles.imagen1,'UserData',imag1);           %Mandamos a imagenaxes1
else
    imag1 = imagenE;
           axes(handles.imagen1); 
           imshow(imag1), title('1° Imagen');
    set(handles.imagen1,'UserData',imag1);
    
end
% -----------------------------------------
%IMAGEN DOS
% -----------------------------------------
[nombreImagen Path] = uigetfile(formatos, 'Elija  Imagen 2 porfavor'); 
[X, map]=imread(fullfile(Path,nombreImagen));
imagenE = imread(fullfile(Path,nombreImagen));

if ~isempty(map)
    imag2 = ind2rgb(X, map);                               %Transforma de Indexada a rgb
    axes(handles.imagen2);                            %Especificamos el axes
     imshow(imag2), title('2° Imagen');                                        %Mostramos la imagen    
    set(handles.imagen2,'UserData',imag2);           %Mandamos a imagenaxes1
else
    imag2 = imagenE;
    axes(handles.imagen2); 
      imshow(imag2), title('2° Imagen');
    set(handles.imagen2,'UserData',imag2);
    
end
% -----------------------------------------
%IMAGEN TRES
% -----------------------------------------

[nombreImagen Path] = uigetfile(formatos, 'Elija  Imagen 3 porfavor..');
[X, map]=imread(fullfile(Path,nombreImagen));
imagenE = imread(fullfile(Path,nombreImagen));

if ~isempty(map)
    imag3 = ind2rgb(X, map);                               %Transforma de Indexada a rgb
    axes(handles.imagen3);                            %Especificamos el axes
    imshow(imag3), title('3° Imagen');                                        %Mostramos la imagen    
    set(handles.imagen3,'UserData',imag3);           %Mandamos a imagenaxes1
else
    imag3 = imagenE;
    axes(handles.imagen3); 
      imshow(imag3),title('3° Imagen');
    set(handles.imagen3,'UserData',imag3);
    
end
% -----------------------------------------
%IMAGEN CUATRO
% -----------------------------------------
[nombreImagen Path] = uigetfile(formatos, 'Elija  Imagen 4 porfavor..');
[X, map]=imread(fullfile(Path,nombreImagen));
imagenE = imread(fullfile(Path,nombreImagen));


if ~isempty(map)
  imag4 = ind2rgb(X,map);
        axes(handles.imagen4);
       imshow(imag4), title('4° Imagen');
   set(handles.imagen4,'UserData',imag4);
else
      imag4 = imagenE;
      axes(handles.imagen4);
        imshow(imag4),title('4° Imagen');
      set(handles.imagen4,'UserData',imag4);
       
end

% -----------------------------------------
% IMAGEN CINCO
% -----------------------------------------
[nombreImagen Path] = uigetfile(formatos, 'Elija  Imagen 5 porfavor..');
[X, map]=imread(fullfile(Path,nombreImagen));
imagenE4 = imread(fullfile(Path,nombreImagen));


if ~isempty(map)
  imag5 = ind2rgb(X,map);
        axes(handles.imagen5);
       imshow(imag5), title('5° Imagen');
   set(handles.imagen5,'UserData',imag5);
else
      imag5 = imagenE4;
      axes(handles.imagen5);
        imshow(imag5),title('5° Imagen');
      set(handles.imagen5,'UserData',imag5);
       
end

% -----------------------------------------
% IMAGEN SEIS
% -----------------------------------------
[nombreImagen Path] = uigetfile(formatos, 'Elija  Imagen 6 porfavor..');
           [X, map] = imread(fullfile(Path,nombreImagen));
           imagenE4 = imread(fullfile(Path,nombreImagen));

if ~isempty(map)
  imag6 = ind2rgb(X,map);
          axes(handles.imagen6);
  imshow(imag6), title('6° Imagen');
  set(handles.imagen6,'UserData',imag6);

else
      imag6 = imagenE4;
      axes(handles.imagen6);
        imshow(imag6),title('6° Imagen');
      set(handles.imagen6,'UserData',imag6);
       
 end
guidata(hObject, handles);

% --- Executes on button press in btnCargar.
function btnCargar_Callback(hObject, eventdata, handles)
    %cargaDirectorio;
      global IU IU2
      %global imag
          Abrir;
          imshow(IU);
      axes(handles.axes1);
       imshow(IU);
      axes(handles.axes2);
      
%         formatos = {'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'};
%        LB_Titulo = 'Elija  una Imagen:  porfavor';
%     
%     [imag Direc] = uigetfile(formatos, 'Elija una Imagen a color...');
%          [X, map] = imread(fullfile(Direc,imag));
%         imagenCol = imread(fullfile(Direc,imag));
%            
% if ~isempty(map)
%   desImRGB = ind2rgb(X,map);
%           axes(handles.axes1);
%   imshow(desImRGB), title('Imagen en RGB');
%   set(handles.axes1,'UserData',desImRGB);
% 
% else
%       desImRGB = imagenCol;
%       axes(handles.axes1);
%            imshow(desImRGB),title('Imagen en RGB');
%       set(handles.axes1,'UserData',desImRGB);
%        
%  end      
guidata(hObject,handles);

function mnuCollage_Callback(hObject, eventdata, handles)
 set(handles.cb_ImEspejo,'Visible','on');
 
set(handles.cb_Rotaciones,'Visible','off');
set(handles.cb_OBasicas,'Visible','off'); 
set(handles.cb_Vecinos,'Visible','off');
set(handles.cb_DetPicos,'Visible','off');
set(handles.lb_Bordes,'Visible','off');
set(handles.cb_OpMorfologicas,'Visible','off');

set(handles.txtEE,'Visible','off');%LABEL INST
set(handles.axes1,'Visible','off');  
disp('Estas en collage de una sola imagen');
 
set(handles.sdr_eEstructurante,'Visible','off');
set(handles.cb_AdSus,'Visible','off');
%set(handles.pnlImagen1,'Visible','off');
%set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
guidata(hObject,handles);

%Nota: Para no tener problemas con los paneles
%Deben de acomdarse de una forma especifica
%El orden no determina cual se pinta primera
%pero si hay que tener cuidado en acomodarlo en la vista diseño
%va de forma apilada.

% --- Este radioBtn es para binarizar.
function rb_Binarizar_Callback(hObject, eventdata, handles)
        %set(handles.btnGpoS,'Visible','on');
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
   
      %APLICANDO EL EFECTO DE BINARIZACIÓN
    axes(handles.SeisImagenes);
         imshow(paBinarizar),title('Binarización"');    
         
guidata(hObject,handles);

% --- Executes on button press in rbBin45.
function rbBin45_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
           rBin45 = imrotate(paBinarizar,45);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 45
    axes(handles.SeisImagenes);
         imshow(rBin45),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% --- Executes on button press in rbBin90.
function rbBin90_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
           rBin90 = imrotate(paBinarizar,90);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 90 GRADOS
    axes(handles.SeisImagenes);
         imshow(rBin90),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% --- Executes on button press in rbBin135.
function rbBin135_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
           rBin135 = imrotate(paBinarizar,135);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 45
    axes(handles.SeisImagenes);
         imshow(rBin135),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% --- Executes on button press in rbBin180.
function rbBin180_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
           rBin180 = imrotate(paBinarizar,180);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 45
    axes(handles.SeisImagenes);
         imshow(rBin180),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% --- Executes on button press in rbBin225.
function rbBin225_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
           rBin225 = imrotate(paBinarizar,225);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 45
    axes(handles.SeisImagenes);
         imshow(rBin225),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% --- Executes on button press in rbBin270.
function rbBin270_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
           rBin270 = imrotate(paBinarizar,270);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 45
    axes(handles.SeisImagenes);
         imshow(rBin270),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% --- Executes on button press in rbBin315.
function rbBin315_Callback(hObject, eventdata, handles)
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/5;
    n = n/5; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
             VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
      
         pEGrises = rgb2gray(VC_SI);
      paBinarizar = 255-pEGrises;
        
          rBin315 = imrotate(paBinarizar,315);
            
      %APLICANDO EL EFECTO DE BINARIZACIÓN CON ROTACIÓN DE 45
    axes(handles.SeisImagenes);
         imshow(rBin315),title('"Binarización Collage de 45°"');    
guidata(hObject,handles);

% Menu multiopción de mosaicos
function pmMosaicos_Callback(hObject, eventdata, handles)
global VC_SI;
imag1 =  get(handles.imagen1, 'UserData');
imag2 =  get(handles.imagen2, 'UserData');
imag3 =  get(handles.imagen3, 'UserData');
imag4 =  get(handles.imagen4, 'UserData');
imag5 =  get(handles.imagen5, 'UserData');
imag6 =  get(handles.imagen6, 'UserData');
 VIM =  get(handles.SeisImagenes, 'UserData');
[m n] = size(imag1); 
    
    m = m/2;
    n = n/2; 

IU1  = imresize(imag1, [m n/3]);
IU2  = imresize(imag2, [m n/3]);
IU3  = imresize(imag3, [m n/3]);
IU4  = imresize(imag4, [m n/3]);
IU5  = imresize(imag5, [m n/3]);
IU6  = imresize(imag6, [m n/3]);
  
   global AM12 AM24 AM48 AM12B AM24B AM48B;    
   
    %VC_SI = [IU1 IU2; IU3 IU4; IU5 IU6];
    
    
                      VC_SI = [IU1 IU2 IU3; IU4 IU5 IU6];
            pEGrisesMosaico = rgb2gray(VC_SI);

opMosaic = get(handles.pmMosaicos,'Value');
%%CASO PARA DOBLAR LOS MOSAICOS HACIA ABAJO%%%
 switch(opMosaic)
     
     case 1
         AM12 = [VC_SI; VC_SI];
                imshow(AM12);
        axes(handles.SeisImagenes);
     case 2
       
         AM24 = [AM12; AM12]; 
           imshow(AM24);
         axes(handles.SeisImagenes);
     case 3
         
         AM48 = [AM24;AM24];
         A_CUATRO = imresize(AM48,4.3);
         auxCuat = A_CUATRO;
              imshow(auxCuat);
          axes(handles.SeisImagenes);
          
        case 4
         
         AM96 = [AM48;AM48];
          %A_OCTUPLE = imresize(AM48,1.3);
             %axOcho = A_OCTUPLE;
            imshow(AM96);
          axes(handles.SeisImagenes);
    %%CASO PARA DOBLAR LOS MOSAICOS  EN BINARIO HACIA ABAJO%%%
         case 5
             disp('Elegiste Mosaico Binario 12 S/Rotar°');
               mosaicBinary = 255-pEGrisesMosaico;
               
             AM12B = [mosaicBinary; mosaicBinary];
                    imshow(AM12B);
            axes(handles.SeisImagenes);
         
         case 6       
           disp('Elegiste Mosaico Binario 24 S/Rotar°');
               AM24B = [AM12B; AM12B]; 
               imshow(AM24B);
             axes(handles.SeisImagenes);
         
        case 7
       disp('Elegiste Mosaico Binario 48 S/Rotar°');
         AM48 = [AM24B;AM24B];
         %ITDOBLE = imresize(AM48,3.5);
       %auxTriple = ITDOBLE;
              imshow(AM48);
          axes(handles.SeisImagenes); 
          
     case 8  
          disp('Elegiste Mosaico Binario 12 rotado 90°');
          AP_MB12_90_G = imrotate(AM12B,90);
                          imshow(AP_MB12_90_G);
                 axes(handles.SeisImagenes);
                   
         
                 
     case 9 
        disp('Elegiste Mosaico Binario 12 rotado 135°');
          AP_MB12_135_G = imrotate(AM12B,135);
                          imshow(AP_MB12_135_G);
                 axes(handles.SeisImagenes);
     
     case 10
         disp('Elegiste Mosaico Binario 12 rotado 170°');
          AP_MB12_170_G = imrotate(AM12B,170);
                          imshow(AP_MB12_170_G);
                        axes(handles.SeisImagenes);
         
     case 11 
           disp('En Construcción..');
            %FM_APL_I = median(VC_SI,[3 3]);
                       %imshow(FM_APL_I);
                    %axes(handles.SeisImagenes);
           
     otherwise
      disp('Error: La opción no es valida');
 
 end
 



 
   %ITDOBLE = imresize(AM48,[m*2 n*1]);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pmMosaicos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pmMosaicos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Ejecutae el combo de Filtros de vecinos
function cb_Vecinos_Callback(hObject, eventdata, handles)
  global IU FV G_IU
  opRot = get(handles.cb_Vecinos,'Value');
  
  switch(opRot)
      
      case 1
           h4v = [0 1 0; 1 -4 1; 0 1 0];
           FV = imfilter(IU, h4v);          
                axes(handles.axes2);
            imshow(FV), title('4 vecinos "Positivo"');     
      case 2
          
           h4vN = [0 -1 0; -1 4 -1; 0 -1 0];
           FV = imfilter(IU,h4vN);
                axes(handles.axes2);
              imshow(FV), title('4 vecinos "Negativo"');
      case 3
          h8v = [1 1 1; 1 -8 1; 1 1 1];
           FV = imfilter(IU,h8v);
                axes(handles.axes2);
                imshow(FV), title('8 Vecinos Positivo');
                
      case 4
          h8vN = [-1 -1 -1; -1 8 -1; -1 -1 -1];
           FV = imfilter(IU,h8vN);
                axes(handles.axes2);
                 imshow(FV), title('8 Vecinos Negativo');
      case 5
        G_IU = rgb2gray(IU);
          R1 = imnoise(G_IU,'gaussian',0.01);
              axes(handles.axes1);
                imshow(R1); title('Contaminada Ruido Gaussiano');
      H_PROM = fspecial('average',[3 3]);
    A_H_PROM = imfilter(R1,H_PROM);
              axes(handles.axes2);
                imshow(A_H_PROM); title('Limpia Ap. Filtro Promedio');
            
      case 6
          NS = imnoise(G_IU,'salt & pepper',0.01);
               axes(handles.axes1);
                 imshow(NS), title('Contminar:  "Sal y Pimíenta"'); 
     A_F_MDIA = medfilt2(NS);
                axes(handles.axes2);
                imshow(A_F_MDIA); title('Limpia Ap. Filtro Promedio');
         
      otherwise
         disp('Error: Filtro no valido');
  end
guidata(hObject,handles);

% Hints: contents = cellstr(get(hObject,'String')) returns cb_Vecinos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cb_Vecinos


% --- Executes during object creation, after setting all properties.
function cb_Vecinos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb_Vecinos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in cb_OBasicas.
function cb_OBasicas_Callback(hObject, eventdata, handles)
opB = get(handles.cb_OBasicas,'Value');
 global EG IU;
   
 switch(opB)
     
     case 1
           Ir = rgb2gray(IU);
      [cont,x] = imhist(Ir);
          axes(handles.axes2), 
            imhist(Ir) ,title('Histograma Normal');
          guidata(hObject,handles);  
          
     case 2 
                ITG = rgb2gray(IU);
          [cont, x] = imhist(ITG);
            [mE,nE] = size(ITG);
             va = 0;
   
            for  v = 1: 256
              H(v) = va+cont(v);
                va = H(v);
            end
            for i = 1: mE
               for j = 1: nE
                      Acum = ITG(i,j);
                 ImpE(i,j) = H(Acum+1)*(255/(mE*nE));
               end
            end
   
               ImpE = mat2gray(ImpE);

                     axes(handles.axes2),
                    imhist(ImpE), title('Histograma Ecualizado');
                    guidata(hObject,handles); 
         
     case 3
           disp('Seleccionaste Escala de Grises..');
         %I1 = imshow(IU);
       EG = rgb2gray(IU);
            imshow(EG), title('Imagen: en Esc. Grises');
         axes(handles.axes2);
           
         
     case 4
         disp('Selecccionaste Inversión Binaria..');
         IB = 255-EG;
             imshow(IB);
         axes(handles.axes2);
        
        
     case 5
         %Probando almacenando un set para guardar la información de c/axes
         IU =  get(handles.axes1, 'UserData'); %en RGB;
         I2 =  get(handles.axes2,'UserData');
        
         R1_rgb = imresize(IU,[800 650]);
         R2_rgb = imresize(I2,[800 650]);
         %conversion a Grises
         G1 = rgb2gray(R1_rgb);
         G2 = rgb2gray(R2_rgb);
         
         %Desp. una Adición en Grises
         
         Sum_E_G = G1+G2;
                   imshow(Sum_E_G);
                   axes(handles.axes2);
         
         %Res_rgb = I1-I2;
         
         
         
         
         
     otherwise
         disp('ERROR: Opción no valida..');
 end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function cb_OBasicas_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Ejecuta el comboBox de Rotaciónes Sexadecimales
function cb_Rotaciones_Callback(hObject, eventdata, handles)
 global IU RU
   
      opRot = get(handles.cb_Rotaciones,'Value');
        
  switch(opRot)
      
      case 1
             RU = imrotate(IU,30);
                  imshow(RU),title('Rotación 30°');
                   axes(handles.axes2);
      case 2
           RU = imrotate(IU,45);
                imshow(RU), title('Rotación 45°');
                 axes(handles.axes2);
          
      case 3
          RU = imrotate(IU,90);
               imshow(RU),title('Rotación 90°');
                axes(handles.axes2);
                     
      case 4
           RU = imrotate(IU,135);
                 imshow(RU),title('Rotación 135°');
                 axes(handles.axes2);
        
      case 5          
           RU = imrotate(IU,180);
                 imshow(RU),title('Rotación 180°');
               axes(handles.axes2);
      case 6
          RU = imrotate(IU,225);
                imshow(RU),title('Rotación 215°');
               axes(handles.axes2);
      case 7
          RU = imrotate(IU,270);
                imshow(RU),title('Rotación 270°');
               axes(handles.axes2);
         
      case 8
        RU = imrotate(IU,315);
                imshow(RU),title('Rotación 315°');
               axes(handles.axes2);
      case 9
          RU = imrotate(IU,360);
               imshow(RU), title('Imagen 360°');
              axes(handles.axes2);
              
      otherwise
          disp('OPCIÓN NO VALIDA');
  end
  
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function cb_Rotaciones_CreateFcn(hObject, eventdata, handles)



if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCargarEG.
function btnCargarEG_Callback(hObject, eventdata, handles)
global IU;
   %Abrir;
      % imshow(IU);
   %axes(handles.axes1);
    imshow(IU);
  axes(handles.axes2);
guidata(hObject,handles);
%%--------------------------------------------------------------------%%
% --- Comp. Combo para ejecutara acciónes de Efecto espejoe en Imagen--%
%%--------------------------------------------------------------------%%
function cb_ImEspejo_Callback(hObject, eventdata, handles)
  global IU VOLTEAR NORMAL R1 R2 CE_2X2 I_CE1 I_CE2  I_CE3 AM_I_CE CM_4x4 CME_4 A_CL3 AX_CL1
  
  opMoUIm = get(handles.cb_ImEspejo,'Value');
 
              R1 = imrotate(IU,180,'bilinear'); 
              R2 = imrotate(IU,360,'bilinear'); 
              
        VOLTEAR  = [R1 R1];
          NORMAL = [R2 R2];
                 
 switch opMoUIm
     case 1
         disp('Elegiste un Mosaico Combinación: Dos Por Dos');
           
           I_CE1 = [R1,R1;R2,R2];
          ME_2x2 = flip(I_CE1,1);
                   imshow(ME_2x2), title('Imagen Espejo');
                 axes(handles.axes2);
     case 2
         disp('Elegiste un Mosaico Combinación: Cuatro Por Dos');
      %I_CE2 = [R1 R1; R2 R2; R1 R1; R2 R2]; (Podría usarse está opc. ó  bien serpia mas adecuado...
           I_CE2 = [I_CE1; I_CE1];  
         AM_I_CE = I_CE2;
         
          ME_4x2 = flip(I_CE2,1);
                   imshow(ME_4x2), title('Espejo Fila: Uno por Dos');
                axes(handles.axes2);
           
     case 3
         disp('Elegiste un Mosaico Combinación: Dos Por Tres');
           
           I_CE3 = [AM_I_CE ; AM_I_CE];
          ME_2x3 = flip(I_CE3,1);
                   imshow(ME_2x3),title('Vec: "4 Filas x 1 Columna"');
                axes(handles.axes2);
     case 4
         disp('Elegiste un Mosaico Combinación: Dos Por Cinco'); 
          I_CE_4 =  [VOLTEAR VOLTEAR; NORMAL NORMAL]; %Vector. (4,1)
          ME_4x2 = flip(I_CE_4,1);
                   imshow(ME_4x2), title('Vec: "1 Fila x 2 Columas"');
                axes(handles.axes2);
                
     case 5
         disp('Elegiste un Mosaico Combinación: Dos Por Cinco'); 
          I_CE_4 =  [VOLTEAR VOLTEAR VOLTEAR; NORMAL NORMAL NORMAL]; %Mtz. (6,1)
          ME_4x2 = flip(I_CE_4,1);
                   imshow(ME_4x2), title('Vec: "1 Fila x 3 Columas"');
                axes(handles.axes2);
     case 6
              
          CM_4x4 = [I_CE2 I_CE2];
          DE_4x4 = flip(CM_4x4);
                   imshow(DE_4x4),title('Mtz: "2 Filas x 2 Columnas"');
                axes(handles.axes2);  
           
     case 7 
          CM_3X3  = [I_CE2 I_CE2 I_CE2; I_CE1 I_CE1 I_CE1];
          DE_3x3  = flip(CM_3X3);
                    imshow(DE_3x3),title('Mtz. "3 Filas x 3 Columnas"');
                axes(handles.axes2);
          
     case 8 %cambio
              
          CME_4 = [CM_4x4 CM_4x4; CM_4x4 CM_4x4;];
         DE_4x4 = flip(CME_4);
                   imshow(DE_4x4), title('Mtz: " 4 Filas x 4 Columnas"');       
                 axes(handles.axes2);
            disp('Se desplego Matriz de imagenes Espejo: 4*4');
            
     case 9
            CB_CME_5 = [I_CE2 I_CE2;I_CE1 I_CE1];
              CB_MED = [CB_CME_5 CB_CME_5; CB_CME_5 CB_CME_5]; 
            
              DE_5x5 = flip(CB_MED);
                       imshow(DE_5x5), title('Mtz: " 4 Filas x 6 Columnas"');
                 axes(handles.axes2);
              
     case 10 %solo modifica aquí
         
           A_C2 = [I_CE1,I_CE1,I_CE1,I_CE1,I_CE1];
          M_5x5 = [A_C2; A_C2; A_C2; A_C2; A_C2];
       CE_M_5x5 = flip(M_5x5);
                 
         %AX_CL2 = [I_CE1,I_CE1];
         %V_5x1 = [AX_CL2, AX_CL2, AX_CL2, AX_CL2, AX_CL2];
          % = [V_5x1; V_5x1; V_5x1; V_5x1; V_5x1];
       %CE_M_5x5 = flip(M_5x5);
                  imshow(CE_M_5x5), title('Mtz. "5 Filas x 5 Columas"');
                axes(handles.axes2);          
     
     case 11  %solo modifica aquí
           AX_CL1 = [I_CE1, I_CE1,I_CE1];
            M_6x6 = [AX_CL1 AX_CL1; AX_CL1 AX_CL1; 
                     AX_CL1 AX_CL1; AX_CL1 AX_CL1; 
                     AX_CL1 AX_CL1; AX_CL1 AX_CL1];
         CE_6X6  = flip(M_6x6);
                   imshow(CE_6X6),title('Mtz: "6 Filas x 6 Columnas"');
                axes(handles.axes2);
               
        %%%%%%%%%%%%%%%no%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55                            
     case 12   
           A_CL3 = [I_CE1, I_CE1];
           M_6x8 = [A_CL3 A_CL3 A_CL3; A_CL3 A_CL3 A_CL3;
                    A_CL3 A_CL3 A_CL3; A_CL3 A_CL3 A_CL3;
                    A_CL3 A_CL3 A_CL3; A_CL3 A_CL3 A_CL3;
                    A_CL3 A_CL3 A_CL3; A_CL3 A_CL3 A_CL3];
        CE_M_6x8 = flip(M_6x8);
                   imshow(CE_M_6x8),title('Mtz: "6 Filas x 8 Columnas"');
                axes(handles.axes2);
  %NOTA: RECUERDE: PARA QU FUNCIONE EL CASO 14  1° SE TIENE QUE EFECUAR LA OP. DEL CASO 12 PQ REUTILIZA SU VARIABLE 'A_CL3'     
     case 13
         A_CL4 = [I_CE1,I_CE1,I_CE1,I_CE1,I_CE1,I_CE1,I_CE1]; 
         M_7x7 = [A_CL4; A_CL4; A_CL4; A_CL4; A_CL4; A_CL4;A_CL4];
     CE7_M_7x7 = flip(M_7x7);
                 imshow(CE7_M_7x7),title('Mtz: "7 Filas x 7 Columnas"');
              axes(handles.axes2);
     
     case 14  
          CME_8 = [CME_4 CME_4; CME_4 CME_4];
           DE_8 = flip(CME_8);
                   imshow(DE_8), title('Mtz: "8 Filas x 8 Columnas"');
               axes(handles.axes2);
     
     case 15
         M_3x3 = [AX_CL1 AX_CL1 AX_CL1; 
                  AX_CL1 AX_CL1 AX_CL1; 
                  AX_CL1 AX_CL1 AX_CL1];
 M_3x3_E_M_9x9 = [M_3x3; M_3x3; M_3x3];
      CE_M_9x9 = flip(M_3x3_E_M_9x9);
                 imshow(CE_M_9x9), title('Mtz: "9 Filas x 9 Columnas"');
               axes(handles.axes2);
     otherwise
          disp('las Dimensiónes del Mosaico no existen o son desconocidas');
 end
 
guidata(hObject,handles);

function cb_ImEspejo_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Esta es la función de Histograma(Ecualizar como op Básica):
% --------------------------------------------------------------------
function mnu_Ec_Callback(hObject, eventdata, handles)
    global IU;       
    disp('Obtendremos el Histograma de tú imagen');
            Ir = rgb2gray(IU);
      [cont,x] = imhist(Ir);
          axes(handles.axes2), 
            imhist(Ir) ,title('Histograma Normal');
          guidata(hObject,handles);  
guidata(hObject,handles);

%Obtener el Histograma Normal de la Imagen elegida por el Usuario
% --------------------------------------------------------------------
function sm_ecNormal_Callback(hObject, eventdata, handles)
 global IU;       
    disp('Obtendremos el Histograma de tú imagen');
            Ir = rgb2gray(IU);
      [cont,x] = imhist(Ir);
               axes(handles.axes2), 
                 imhist(Ir) ,title('Histograma Normal');
guidata(hObject,handles);

%Obtener el Histograma Ecualizado de la Imagen elegida por el Usuario
% --------------------------------------------------------------------
function sm_ecDistribuida_Callback(hObject, eventdata, handles)
global IU
   ITG = rgb2gray(IU);
          [cont, x] = imhist(ITG);
            [mE,nE] = size(ITG);
             va = 0;
   
            for  v = 1: 256
              H(v) = va+cont(v);
                va = H(v);
            end
            for i = 1: mE
               for j = 1: nE
                        Acum = ITG(i,j);
                 ImpE(i,j) = H(Acum+1)*(255/(mE*nE));
               end
            end
   
               ImpE = mat2gray(ImpE);
                    axes(handles.axes2),
                       imhist(ImpE), title('Histograma Ecualizado')
guidata(hObject,handles); 

% --------------------------------------------------------------------
function mnu_Picos_Callback(hObject, eventdata, handles)
 disp('Editando');
%Solo se alza el combo que es ocupado
set(handles.cb_DetPicos,'Visible','on');
%Se inhabilitan todos los comboBox que no se usen   
set(handles.cb_ImEspejo,'Visible','off');
set(handles.cb_Rotaciones,'Visible','off');
set(handles.cb_OBasicas,'Visible','off'); 
set(handles.cb_Vecinos,'Visible','off');
set(handles.cb_OpMorfologicas,'Visible','off');

set(handles.txtEE,'Visible','off');%LABEL INST
set(handles.axes1,'Visible','off');  
     
set(handles.lb_Bordes,'Visible','off');
set(handles.sdr_eEstructurante,'Visible','off');
     

 %set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
 set(handles.cb_AdSus,'Visible','off');
guidata(hObject,handles);

% --------------------------------------------------------------------
function rtn180_Callback(hObject, eventdata, handles)
global IU
  R2 = imrotate(IU,180);
         imshow(R2), title('Rotando: "90°"');
     axes(handles.axes2);
guidata(hObject,handles);


% --------------------------------------------------------------------
function rtn225_Callback(hObject, eventdata, handles)
global IU
  R2 = imrotate(IU,225);
          imshow(R2), title('Rotando: "225°"');
     axes(handles.axes2);
guidata(hObject,handles);

% --------------------------------------------------------------------
function rtn270_Callback(hObject, eventdata, handles)
global IU 
    R2 = imrotate(IU,270);
         imshow(R2), title('Rotando: "270°"');
       axes(handles.axes2);
guidata(hObject,handles);

% --------------------------------------------------------------------
function rtn315_Callback(hObject, eventdata, handles)
global IU 
    R2 = imrotate(IU,315);
         imshow(R2), title('Rotando: "315°"');
       axes(handles.axes2);
guidata(hObject,handles);


% --------------------------------------------------------------------
function rtn360_Callback(hObject, eventdata, handles)
global IU 
    R2 = imrotate(IU,360);
         imshow(R2), title('Rotando: "360°"');
       axes(handles.axes2);
guidata(hObject,handles);

% --- Esta es la parte 2 del proyecto Detección de Picos
function cb_DetPicos_Callback(hObject, eventdata, handles)

global IU h

Pico = get(handles.cb_DetPicos,'Value');

switch (Pico)
    
    case 1
        EG = rgb2gray(IU);
         h = imhist(EG,64); 
             hist(h); %En barras
           axes(handles.axes2);
          
    case 2
        EG = rgb2gray(IU);
        
         h = imhist(EG,64);
             findpeaks(h);
           axes(handles.axes2);
        
    
    case 3
          cG  = rgb2gray(IU);  %Conversión a Esc. de Grises
                imhist(cG,120)
              axes(handles.axes2);
                 
    case 4
     cG_Vm  = rgb2gray(IU);
       pMin = min((cG_Vm));
              imhist(pMin,120);
           axes(handles.axes2);
             
    otherwise
        disp('ERROR: No selecciono nada');
            
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function cb_DetPicos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb_DetPicos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function mnuMorfologias_Callback(hObject, eventdata, handles)
%set(handles.axes1,'Visible','on');
set(handles.axes2,'Visible','on');
%set(handles.axes1,'Visible','on');
 set(handles.txtEE,'Visible','on');
%Se habilita el cb de Morfología para usarse ademas del Slider p/E.%Estructurante.
set(handles.cb_OpMorfologicas,'Visible','on');
set(handles.sdr_eEstructurante,'Visible','on');
%Ihhabilitando todos los demás combos
set(handles.cb_DetPicos,'Visible','off');
set(handles.cb_ImEspejo,'Visible','off');
set(handles.cb_Rotaciones,'Visible','off');
set(handles.cb_OBasicas,'Visible','off'); 
set(handles.cb_Vecinos,'Visible','off');

set(handles.cb_AdSus,'Visible','off');

%set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
 %set(handles.imagen1,'Visible','off');
 %set(handles.imagen2,'Visible','off');
 %set(handles.cb_AdSus,'Visible','off');


% --------------------------------------------------------------------
function sm_HistN_Callback(hObject, eventdata, handles)
global IU 
EG = rgb2gray(IU);
         h = imhist(EG,64); 
             hist(h); %En barras
           axes(handles.axes2);
 guidata(hObject,handles);


% --------------------------------------------------------------------
function sm_DetPicos_Callback(hObject, eventdata, handles)
global IU
EG = rgb2gray(IU);
        
         h = imhist(EG,64);
             findpeaks(h);
           axes(handles.axes2);
 guidata(hObject,handles);



% --------------------------------------------------------------------
function sm_PicMin_Callback(hObject, eventdata, handles)
% hObject    handle to sm_PicMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sm_PicMax_Callback(hObject, eventdata, handles)
% hObject    handle to sm_PicMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% B_Menú obtener descontaminación de una imgen por Filtro Media(Promedio)
function fiProm_Callback(hObject, eventdata, handles)
global G_IU IU
G_IU = rgb2gray(IU);
          R1 = imnoise(G_IU,'gaussian',0.01);
              axes(handles.axes1);
                imshow(R1); title('Contaminada Ruido Gaussiano');
      H_PROM = fspecial('average',[3 3]);
    A_H_PROM = imfilter(R1,H_PROM);
              axes(handles.axes2);
                imshow(A_H_PROM); title('Limpia Ap. Filtro Promedio');
guidata(hObject,handles);

% B_Menú obtener descontaminación de una imgen por Filtro Mediana
% --------------------------------------------------------------------
function fiMedia_Callback(hObject, eventdata, handles)
global G_IU 
%G_IU = rgb2gray(IU);     
NS = imnoise(G_IU,'salt & pepper',0.01);
               axes(handles.axes1);
                 imshow(NS), title('Contminar:  "Sal y Pimíenta"'); 
     A_F_MDIA = medfilt2(NS);
                axes(handles.axes2);
                imshow(A_F_MDIA); title('Limpia Ap. Filtro Promedio');
guidata(hObject,handles);


% --------------------------------------------------------------------
function mnu_Contornos_Callback(hObject, eventdata, handles)
% hObject    handle to mnu_Contornos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Submenu para Bordes Prewwit
% --------------------------------------------------------------------
function smPrewitt_Callback(hObject, eventdata, handles)
global IU
     
     cG = rgb2gray(IU);
 [g, t] = edge(cG,'Prewitt');
       axes(handles.axes2); 
          imshow(g); title('"Borde Prewitt":  Aplicado');
         
guidata(hObject,handles);

%Submenú para Bordes Sobel
% --------------------------------------------------------------------
function sm_Sobel_Callback(hObject, eventdata, handles)
global IU

disp('Selecciono un Borde Sobel');
              
             cGs = rgb2gray(IU);
         [gS,tS] = edge(cGs,'Sobel');
               axes(handles.axes2); 
                    imshow(gS); title('Aplicado:  "Borde Sobel"');
guidata(hObject,handles);

%Submenú para Bordes  Roberts
% --------------------------------------------------------------------
function sm_Roberts_Callback(hObject, eventdata, handles)
global IU
   disp('Seleecionaste: Roberts');
              
           cEG_R = rgb2gray(IU);
        [gR ,t3] = edge(cEG_R,'Roberts');
                 axes(handles.axes2); 
                   imshow(gR), title('Aplico:  "Borde Roberts" ');

guidata(hObject,handles);


% --- Executes on selection change in lb_Bordes.
function lb_Bordes_Callback(hObject, eventdata, handles)
   global IU Bs
 bordes = get(handles.lb_Bordes,'Value');
       
switch bordes
    case 1
     cG = rgb2gray(IU);
 [Bs, t] = edge(cG,'Prewitt');
          axes(handles.axes2); 
          imshow(Bs); title('"Borde Prewitt":  Aplicado');
    case 2
        
        
        cG = rgb2gray(IU);
 [Bs, t] = edge(cG,'Sobel');
          axes(handles.axes2); 
          imshow(Bs); title('"Borde Prewitt":  Aplicado');
    case 3
        cG = rgb2gray(IU);
 [Bs, t] = edge(cG,'Roberts');
          axes(handles.axes2); 
          imshow(Bs); title('"Borde Prewitt":  Aplicado');
    otherwise
           disp('ERROR: Borde no Disponible dentro de la Lista'); 
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function lb_Bordes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lb_Bordes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_GuardarUniv.
function btn_GuardarUniv_Callback(hObject, eventdata, handles)
%guardarImagen;

global formato almacenar
   formato = {'*.*';'*.jpg';'*.png'};
 almacenar = getimage(handles.axes2);
 
 if (almacenar == 0)
     return,
 end
 
 [nomImg,directoryBT] = uiputfile(formato,'Almacenar Imagen');
 if (nomImg == 0)  
     return,
 end
  
    NombArch = fullfile(directoryBT,nomImg);
               imwrite(almacenar,NombArch);
                
guidata(hObject,handles);

%ITEMS DE LA BARRA DE MENÚS DE OPERACIÓNES MORFOLOGÍCAS.
% --------------------------------------------------------------------
function sb_Apertura_Callback(hObject, eventdata, handles)
global IU
valorE = get(handles.cb_OpMorfologicas,'Value');

              IU = handles.img;
           imgCopy = IU;
          cuadrado = strel('square',valorE);
imag_erode_cuadrado = imopen(imgCopy,cuadrado);
                IU = imag_erode_cuadrado;
              
                imshow(IU);
              axes(handles.axes2);
guidata(hObject,handles);


% --------------------------------------------------------------------
function sm_Clausura_Callback(hObject, eventdata, handles)
global IU
valorE = get(handles.cb_OpMorfologicas,'Value'); 
IU = handles.img;
             imgCopy = IU;
            cuadrado = strel('square',valorE);
imag_dilata_cuadrado = imclose(imgCopy,cuadrado);
                 IU = imag_dilata_cuadrado;
                        subplot(handles.axes2),imshow(IU)
    
guidata(hObject,handles);


% --------------------------------------------------------------------
function sm_Erosion_Callback(hObject, eventdata, handles)

global IU
valorE = get(handles.cb_OpMorfologicas,'Value');

              IU = handles.img;
           imgCopy = IU;
          cuadrado = strel('square',valorE);
imag_erode_cuadrado = imerode(imgCopy,cuadrado);
                IU = imag_erode_cuadrado;
              
                imshow(IU);
              axes(handles.axes2);
guidata(hObject,handles);

% --------------------------------------------------------------------
function sm_Dilatacion_Callback(hObject, eventdata, handles)
  global IU
valorE = get(handles.cb_OpMorfologicas,'Value');
     IU = handles.img;
             imgCopy = IU;
            cuadrado = strel('square',valorE);
imag_dilata_cuadrado = imdilate(imgCopy,cuadrado);
                 IU = imag_dilata_cuadrado;
                        subplot(handles.axes2),imshow(IU)
guidata(hObject,handles);

% --- Ejecuta esta función para las operaciónes Morfologicas de una Imagen.
function cb_OpMorfologicas_Callback(hObject, eventdata, handles)
global IU 
valorE = get(handles.cb_OpMorfologicas,'Value');

switch valorE
    
    case 1
        disp('Op 1: Seleccionaste una Erosión');
              IU = handles.img;
           imgCopy = IU;
          cuadrado = strel('square',valorE);
imag_erode_cuadrado = imerode(imgCopy,cuadrado);
                IU = imag_erode_cuadrado;
              subplot(handles.axes2),imshow(IU)
                %imshow(IU);
              %axes(handles.axes2);
    
    case 2
       disp('Op 2: Seleccionaste Morfología de Dilatación');
                  IU = handles.img;
             imgCopy = IU;
            cuadrado = strel('square',valorE);
imag_dilata_cuadrado = imdilate(imgCopy,cuadrado);
                 IU = imag_dilata_cuadrado;
                        subplot(handles.axes2),imshow(IU)
    
    case 3
        disp('Op 3:Seleccionaste Morfología de Apertura');
            IU = handles.img;
        imgCopy = IU;

          cuadrado = strel('square',valorE);
imag_Aper_cuadrado = imopen(imgCopy,cuadrado);
               IU = imag_Aper_cuadrado;
                   subplot(handles.axes1),imshow(IU)
    
    case 4
        disp('Op 4: Seleccionaste una Morfología de Clausura');
       
                  IU = handles.img;
              imgCopy = IU;
             cuadrado = strel('square',valorE);
  imag_Claus_cuadrado = imclose(imgCopy,cuadrado);
                  IU = imag_Claus_cuadrado;
        subplot(handles.axes2),imshow(IU)
    otherwise
            disp('Error:Operacion morfoloogíca no Encontrada');
end

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function cb_OpMorfologicas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb_OpMorfologicas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sdr_eEstructurante_Callback(hObject, eventdata, handles)
valor=get(handles.sdr_eEstructurante,'Value');
set(handles.txtEE,'String',valor);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sdr_eEstructurante_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sdr_eEstructurante (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% % --------------------------------------------------------------------
% function sm_sumaRGB_Callback(hObject, eventdata, handles)
% % hObject    handle to sm_sumaRGB (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% guidata(hObject,handles);
% 
% 
% % --------------------------------------------------------------------
% function sm_restaRGB_Callback(hObject, eventdata, handles)
% % hObject    handle to sm_restaRGB (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% guidata(hObject,handles);
% 
% 
% % --------------------------------------------------------------------
% function sm_restaEG_Callback(hObject, eventdata, handles)
% % hObject    handle to sm_restaEG (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Ejectutamos las acciónes para la Adicion/Sustraccion de Imagenes
function cb_AdSus_Callback(hObject, eventdata, handles)
  global IU IU2  R_RGB1 R_RGB2 R_CG_1 R_CG_2 
  
  %CACHAR CACHAR2  %IU =  get(handles.imagen1, 'UserData');
          R_RGB1 = imresize(IU,[550 500]);
          R_RGB2 = imresize(IU2,[550 500]);

 opSRI = get(handles. cb_AdSus,'Value');

switch opSRI
    case 1   
            %A1 = imread(CACHAR);%'Imagen4.jpg');
            %A2 = imread(CACHAR2);%'Img5.jpg'); 
          
            suma = R_RGB1+R_RGB2;
                   imshow(suma);
                  axes(handles.axes2);
    case 2
           resta = R_RGB1-R_RGB2;
                   imshow(resta);
                  axes(handles.axes2);    
    case 3
           CG_1 = rgb2gray(R_RGB1);
           CG_2 = rgb2gray(R_RGB2);
         
         R_CG_1 = imresize(CG_1,[650 650]);
         R_CG_2 = imresize(CG_2,[650 650]);
         
         sumaEG = R_CG_1+R_CG_2;
                  imshow(sumaEG);
                 axes(handles.axes2);
                 
    case 4
        restaEG = R_CG_1-R_CG_2;
                   imshow(restaEG);
                  axes(handles.axes1);
    otherwise
            disp('Error: No haz seleccionado nada');

end

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function cb_AdSus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cb_AdSus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function mnu_SumaRestaImg_Callback(hObject, eventdata, handles)
    set(handles.axes1,'Visible','off');
    set(handles.axes2,'Visible','on');
    
 %set(handles.pnlImagen1,'Visible','off');
 %set(handles.pnlImagen2,'Visible','off');
   
    
   set(handles.cb_AdSus,'Visible','on');
    set(handles.cb_OBasicas,'Visible','off');
    set(handles.cb_Vecinos,'Visible','off');
    set(handles.cb_Rotaciones,'Visible','off');
    set(handles.cb_DetPicos,'Visible','off');
    set(handles.cb_OpMorfologicas,'Visible','off');
    %Componente externos de las operaciones Morfologicas(Inhabilitados)
    set(handles.sdr_eEstructurante,'Visible','off');
    set(handles.txtEE,'Visible','off');

 %Una adición de Imagenes RGB
% --------------------------------------------------------------------
function sm_sumRGB_Callback(hObject, eventdata, handles)
global RGB_1 RGB_2 IM1 IM2 
%opSRI = get(handles. cb_AdSus,'Value');
IM1 = imresize(RGB_1,[550 500]);
IM2 = imresize(RGB_2,[550 500]);

%P2: Sumar Imagenes

sumRGB = IM1+IM2;

 imshow(sumRGB);
 axes(handles.axes1);

guidata(hObject,handles);   
    
%Una Sustracción de Imagenes RGB
% --------------------------------------------------------------------
function sm_resRGB_Callback(hObject, eventdata, handles)
global  RGB_1 RGB_2 I1 I2

I1 = imresize(RGB_1,[550 500]);
I2 = imresize(RGB_2,[550 500]);

%P2: Restar Imagenes

sumRGB = I1-I2;

 imshow(sumRGB);
 axes(handles.axes1);
    
    
% AP-. UNA ADICIÓN DE  IMAGENES ESCALA DE GRISES
% --------------------------------------------------------------------
function sm_sumEG_Callback(hObject, eventdata, handles)
global T_R_RGB1 T_R_RGB2 RGB1 RGB2  i1 i2    
  %1.Recibir c/imagen para transformarla a E. Grises
          i1 = rgb2gray(RGB1);
          i2 = rgb2gray(RGB2);
   %2. Redimensionar c/imagen para que pueda realizar la suma de píxel a píxel     
          T_R_RGB1 = imresize(i1,[650 650]);
          T_R_RGB2 = imresize(i2,[650 650]);
   %3. Realizar la Suma de los píxeles de las imagenes       
            sumaEG = T_R_RGB1+T_R_RGB2;
   %Desplegar la Adiccion Binaria       
             imshow(sumaEG);
        axes(handles.axes2);
        
guidata(hObject,handles);

% AP-. UNA SUSTRACCIÓN DE IMAGENES RESCALA DE GRISESGB
% --------------------------------------------------------------------
function sm_resEG_Callback(hObject, eventdata, handles)
global I1 I2 TRGB_EG TRGB_EG2

 TRGB_EG = rgb2gray(I1);
TRGB_EG2 = rgb2gray(I2);

DIT1_EG = imresize(TRGB_EG,[650 650]);
DIT2_EG = imresize(TRGB_EG2,[650 650]);

 sumEG = DIT1_EG-DIT2_EG;
 
 imshow(sumEG);
 axes(handles.axes2);

guidata(hObject,handles);

% --- Executes on button press in abrirSR.
function abrirSR_Callback(hObject, eventdata, handles)
global IU CACHAR CACHAR2 IU2
extensiones = {'*.jpg*';'*.tif*';'*.bmp*';'*.ppm*';'*.jpeg*';'*.png*'};
[Formatos,b_Titulo] = uigetfile(extensiones,'Ver imagenes');
                  IU = imread(Formatos);
                  %IU2 = imread(Formatos);       

                     imshow(IU);
             %CACHAR =  get(handles.imagen1, 'UserData');
             %CACHAR2 =  get(handles.imagen1, 'UserData');
                     %imshow(IU2);
guidata(hObject,handles);
