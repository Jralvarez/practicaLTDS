%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Javier García Zurdo     jgzurdo@pa.uc3m.es
% Daniel Ruesga Ibáñez    100071034@alumnos.uc3m.es
%
% Diciembre de 2012
%
% Devuelve el error cuadrático medio entre 2 vectores
% que deben tener la misma dimensión.
%
function e = ecm(x, y)
	%Colocar los vectores como columnas si no lo están
	x = x(:);
	y = y(:);
	e = sum((x - y).^2)/length(x);
end

