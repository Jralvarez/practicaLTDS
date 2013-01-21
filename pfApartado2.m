%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Javier García Zurdo     jgzurdo@pa.uc3m.es
% Daniel Ruesga Ibáñez    100071034@alumnos.uc3m.es
%
% Diciembre de 2013
clear all;
close all;

load s1.mat;
load s2.mat;

disp 'Parte 2'
disp '- Apartado 1'
% Hallar el filtro igualador a partir
% de las señales de entrada y salida
% (obtener el filtro (igualador) que
% a partir de y, compensa el canal
% y devuelve x)
w1 = wiener(y, x, 3);
disp(w1');

disp '- Apartado 2'
% Estimar el canal a partir 
% de las señales de entrada y salida
% (obtener el filtro (canal)  que al convolucionar
% con x da y)
h = wiener(x, y, 2);
disp(h');

disp '- Apartado 3'
%Hallar el filtro igualador a partir de
% la estimación del canal
H = zeros(4,3);
H(1:2,1) = h;
H(2:3,2) = h;
H(3:4,3) = h;
sigma = 1/2;
Es = 1;
w3 = inv(H.'*H + (sigma^2)/(Es)*eye(3))*H.'*[1;0;0;0]
