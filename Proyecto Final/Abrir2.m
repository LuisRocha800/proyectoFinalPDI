function [IMM]= Abrir2(Formatos,b_Titulo)
global IMM IU1 IU2 IU3 IU4 IU5 IU6 Imag1 Imag2 Imag3 Imag4 Imag5 Imag6

[Imag1,Path_1] = uigetfile({'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'},'Elegir imagenen 1');
[Imag2,Path_2] = uigetfile({'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'},'Elegir imagenen 2');
[Imag3,Path_3] = uigetfile({'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'},'Elegir imagen 3');
[Imag4,Path_4] = uigetfile({'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'},'Elegir imagene 4');
[Imag5,Path_5] = uigetfile({'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'},'Elegir imagene 5');
[Imag6,Path_6] = uigetfile({'*.jpg*','Imagen(*.jpg*)';'*.png*','Imagen(*.png*)'},'Elegir imagene 6');
                 
            %B1 = cat(2,Imag1,Imag2,Imag3,Imag4,Imag5,Imag6);
           IU1 = imread(Imag1);
           IU2 = imread(Imag2);
           IU3 = imread(Imag3);
           IU4 = imread(Imag4);
           IU5 = imread(Imag5);
           IU6 = imread(Imag6);
                 
                 %IMM = [IU1,IU2; IU3,IU4; IU5,IU6];
                       %imshow(IMM);
end