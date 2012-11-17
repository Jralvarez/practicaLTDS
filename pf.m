
clear all;

load s1.mat;
load s2.mat;

x = filter([0 0 1], 1, y);

disp 'Parte 1'
disp '- Apartado 1: Halle los coeficientes del filtro de Wiener w (aproximado) para diferentes valores de P = 1, 2, 3, 10.'

disp 'P = 1'
w = wiener(y, x, 1);
disp(w');

disp 'P = 2'
w = wiener(y, x, 2);
disp(w');

disp 'P = 3'
[w Ryy ryx] = wiener(y, x, 3);
disp(w');

disp 'P = 10'
w = wiener(y, x, 10);
disp(w');

disp '- Apartado 2: Escriba la estimación de Ryy para P = 3';
disp(Ryy);

disp '- Apartado 3: Escriba la estimación de ryy para P = 3';
disp 'Coincide con la primera fila de Ryy'
disp(Ryy(1,:));

disp '- Apartado 4: Escriba la estimación de ryx para P = 3';
disp(ryx');

	
