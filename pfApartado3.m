clear all;
close all;

load s1.mat;
load s2.mat;

%Debug
%x = filter([0 0 1], 1, y); 
%y = filter([0 0 1], 1, x); 
%y = x;

disp 'Parte 3'
disp '- Apartado 1'
coefs = [.5 .5];
x = generarProcesoAutoregresivo(coefs, 2000, 2);


disp '- Apartado 2'
disp ''
disp 'x[n] = a1 x[n-1] + a2 x[n-2] + e[n]'
disp 'X(z) = a1 X(z) z^-1 + a2 X(z) z^-2 + E(z)'
disp ''
disp 'X(z)[1 - a1 z^-1 -a2 z^-2] = E(z)'
disp ''
disp 'X(z)                   1'
disp '---- = H(z) = ---------------------'
disp 'E(z)          1  -a1 z^-1 - a2 z^-2'
disp ''


disp 'polos'
roots([1 - coefs])
disp 'El sistema es estable porque con a1 = a2 = 0.5 las'
disp 'raíces del polinomio son 1 y -0.5. La estabilidad es'
disp 'crítica por haber un polo sobre el círculo unidad.'
disp ''
disp 'Eligiendo a2 = 0.503 se tiene que el polo antes situado'
disp 'en 1 se desplaza a 1.002, suficiente para apreciar claramente'
disp 'la inestabilidad del sistema si se genera la señal del enunciado'


disp '- Apartado 3 y 4'
disp 'p=1'
coefs = [0.5]'
x = generarProcesoAutoregresivo(coefs, 2000, 2);
w = wiener(x(1:end-1), x(2:end), length(coefs), 'wienerhopfs')
y = generarProcesoAutoregresivo(w, 2000, 2);
errCuad = ecm(x, y)

disp 'p=2'
coefs = [0.5 0.5]'
x = generarProcesoAutoregresivo(coefs, 2000, 2);
w = wiener(x(1:end-1), x(2:end), length(coefs), 'wienerhopfs')
y = generarProcesoAutoregresivo(w, 2000, 2);
errCuad = ecm(x, y)

disp 'p=3'
coefs = [0.5 0.1 0.1]'
x = generarProcesoAutoregresivo(coefs, 2000, 2);
w = wiener(x(1:end-1), x(2:end), length(coefs), 'wienerhopfs')
y = generarProcesoAutoregresivo(w, 2000, 2);
errCuad = ecm(x, y)






