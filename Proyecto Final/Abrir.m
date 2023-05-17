
function [DI]= Abrir(Formatos,b_Titulo)
global  extensiones    IU  %IU3 IU4 IU5 IU6 IU7 IU8   pathGrl 

  extensiones = {'*.jpg*';'*.tif*';'*.bmp*';'*.ppm*';'*.jpeg*';'*.png*'};
[Formatos,b_Titulo] = uigetfile(extensiones,'Ver imagenes');
                 IU = imread(Formatos);
%       

                     imshow(IU);
         


%                  VP = imfinfo(Formatos);
%                  
%                  nI = VP.Filename;
%                  TC = VP.CodingProcess;
%                   A = VP.Height;
%                   L = VP.Width;
%                  PB = VP.BitDepth;
%                
%                  disp('Nombre:      '), disp(nI);
%                  disp('T_Codificacion:'),disp(TC);
%                  disp('Altura: '),disp(A);
%                  disp('Anchura: '), disp(L);
%                  disp('Profundidad de Bits: '), disp(PB);
                
                 
                 
%                pathGrl = fullfile(Formatos,b_Titulo);
              
                %krctrtks = imfinfo(pathGrl);
                %tam1     = int2str(krctrtks.Width);
                %tam1     = strcat(tam1,'x');
                %tam1     = strcat(tam1,int2str(krctrtks.Height));                   
 end