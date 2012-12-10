%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Diciembre de 2012
%
% Ejecuta el algoritmo lms sobre la señal deseada d
% y la entrada u. Devuelve el una matriz w que
% contiene en cada fila el vector de pesos w[n] tal que
% d[n] = u[n] * w[n] en cada instante n.
%
% p es el número de coeficientes del filtro
% y mu un parametro que controla la velocidad
% de actalización de w en cada paso del algoritmo.
%
function [w, e] = lms(u, d, p, mu)
	% Forzar que los vectores de señal sean
	% filas
	u = u(:)';
	d = d(:)';


	w = zeros(length(u)+1, p);
	e = zeros(1, length(u));
	uExt = [zeros(1, p-1), u];
	for n=1:length(u)
		y(n) = w(n,:)*uExt(n+p-1:-1:n).';		
		e(n) = d(n) - y(n);
		w(n+1,:) = w(n,:) + mu*uExt(n+p-1:-1:n)*e(n)';
	end
end
