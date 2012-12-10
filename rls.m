%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Diciembre de 2012
%
% Ejecuta el algoritmo rls sobre la señal deseada d
% y la entrada u. Devuelve el una matriz w que
% contiene en cada fila el vector de pesos w[n] tal que
% d[n] = u[n] * w[n] en cada instante n.
%
% p es el número de coeficientes del filtro
% y lambda un parametro que controla la velocidad
% de actalización de w en cada paso del algoritmo.
%
function [w, e] = rls(u, d, p, lambda)

	%Inicialización
	%(fuerzo a que sean vectores columna)
	u = u(:);
	d = d(:);

	delta = 1e-4;
	N = length(u); %número de muestras de la señal
	P = eye(p, p)/delta;
	w = zeros(N+1, p); % En cada fila n está w(n)
	e = zeros(1, N);
	
	u = [zeros(p-1, 1); u];
	%uExt = [zeros(1, p-1), u];
	for n=1:N;
		%Variables previas
		piEne = u(n+p-1:-1:n)'*P;
		k = lambda + piEne*u(n+p-1:-1:n);
		%Vector ganancia
		g = (P*u(n+p-1:-1:n))/k;
		%Innovación
		alfa = d(n) - w(n,:)*u(n+p-1:-1:n);
		e(n) = alfa;
		%Actualización de los pesos
		w(n+1,:) = (w(n,:)' + g*conj(alfa))';
		%Actualización de la memoria
		P = (P - g*piEne)/lambda;

	end

end
