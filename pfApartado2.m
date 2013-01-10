clear all;
close all;

load s1.mat;
load s2.mat;

%Debug
%x = filter([0 0 1], 1, y); 
%y = filter([0 0 1], 1, x); 
%y = x;

disp 'Parte 2'
disp '- Apartado 1'

w1 = wiener(y, x, 3);
disp(w1');

disp '- Apartado 2'

h = wiener(x, y, 2);
disp(h');

disp '- Apartado 3'

H = zeros(4,3);
H(1:2,1) = h;
H(2:3,2) = h;
H(3:4,3) = h;
sigma = 1/2;
Es = 1;
w3 = inv(H.'*H + (sigma^2)/(Es)*eye(3))*H.'*[1;0;0;0]
