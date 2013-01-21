%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Javier García Zurdo     jgzurdo@pa.uc3m.es
% Daniel Ruesga Ibáñez    100071034@alumnos.uc3m.es
%
% Noviembre de 2012
%
% A partir de la función de autocorrelación
% de la señal x,
% de M retardos con p = length(r) - 1
% calcula el fitro que aproxima la señal
% x, de coeficientes a, de tal forma que si
% se filtra un ruido gaussiano de varianza
% P, con los coeficiented a, se obtiene una
% señal cuya autocorrelación es la r proporcionada
%
% Utiliza el algoritmo de Levinson-Durbin
%
function [a P] = levinsonDurbinRec(r)

%Fuerzo a que r sea columna
r = r(:);

%Inicialización
P = r(1);
a = [1];
M = length(r) - 1;

for m=0:M-1;
	ab = a(end:-1:1);
    y = r(2:m+2).'*ab;
	gamma = -y/P;
	a = [a; 0] + gamma*[0; ab];
	P = P*(1-abs(gamma)^2);

end

end
