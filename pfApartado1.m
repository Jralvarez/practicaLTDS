clear all;
close all;

load s1.mat;
load s2.mat;

%Debug
%x = filter([0 0 1], 1, y); 
%y = filter([0 0 1], 1, x); 
%y = x;

disp 'Parte 1'
disp '- Apartado 1: Halle los coeficientes del filtro de Wiener w (aproximado) para diferentes valores de P = 1, 2, 3, 10.'

disp 'P = 1'
w1 = wiener(y, x, 1);
disp(w1');

disp 'P = 2'
w2 = wiener(y, x, 2);
disp(w2');

disp 'P = 3'
[w3 Ryy ryx] = wiener(y, x, 3);
disp(w3');

disp 'P = 10'
w10 = wiener(y, x, 10);
disp(w10');

disp '- Apartado 2: Escriba la estimación de Ryy para P = 3';
disp(Ryy);

disp '- Apartado 3: Escriba la estimación de ryy para P = 3';
disp 'Coincide con la primera fila de Ryy'
disp(Ryy(1,:));

disp '- Apartado 4: Escriba la estimación de ryx para P = 3';
disp(ryx');

	
disp '- Apartado 5: Calcule el ecm de la estimación para cada filtro'
disp 'P = 1'
xEst = filter(w1, 1, y);
e = ecm(xEst, x)

disp 'P = 2'
xEst = filter(w2, 1, y);
e = ecm(xEst, x)

disp 'P = 3'
xEst = filter(w3, 1, y);
e = ecm(xEst, x)

disp 'P = 10'
xEst = filter(w10, 1, y);
e = ecm(xEst, x)

disp 'La señal x[n] está formada por símbilos equiprobables {-1, +1}. Si utiliza un decisor símbolo a símbolo sin memoria después del igualador, calcule la tasa de error de decisión para cada posible P'

disp 'P = 1'
xEst = (filter(w1, 1, y) > 0)*2 - 1; 
Perr = sum(x ~= xEst)/length(x)

disp 'P = 2'
xEst = (filter(w2, 1, y) > 0)*2 - 1; 
Perr = sum(x ~= xEst)/length(x)

disp 'P = 3'
xEst = (filter(w3, 1, y) > 0)*2 - 1; 
Perr = sum(x ~= xEst)/length(x)

disp 'P = 10'
xEst = (filter(w10, 1, y) > 0)*2 - 1; 
Perr = sum(x ~= xEst)/length(x)

disp 'Repita el punto 1 utilizando un algoritmo LMS para P=2 y mu=0.01. Muestre los coeficientes obtenidos y la convergencia del algoritmo.'
[w2lms, elms] = lms(y, x, 2, 0.01);
plot(w2lms(:,1), 'r');
hold on;
plot(w2lms(:,2), 'b');
hold off;
figure;
plot(elms);

disp 'Repita el punto 1 utilizando un algoritmo RLS para P=2 y lambda=0.95. Muestre los coeficientes obtenidos y la convergencia del algoritmo.'
[w2rls, erls] = rls(y, x, 2, 0.95);
figure;
plot(w2rls(:,1), 'r');
hold on;
plot(w2rls(:,2), 'b');
hold off;
figure;
plot(erls);
