%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Noviembre de 2012
%
% Devuelve un vector con los P coeficientes del
% filtro de Wiener tal que x[n] =~ w[n] * p[n]
%
% El parámetro impl permite elegir entre una
% implementación basada en solución mínimos cuadrados
% (impl='ls', por defecto) 
% y una según las ecuaciones de Wiener-Hopfs
% (impl='wienerhopfs') 
% El resultado debería ser el mismo
% con cualquiera de las dos implementciones.
%
function [w Ryy ryx] = wiener(y, x, P, impl)
	
	if(nargin < 4)
		impl = 'leastsquare';
	end
	
	if(impl == 'wienerhopfs')
		% Implementación basada en las ecuaciones
		% de Wiener-Hopfs
		M = P - 1;
		
		ryx = xcorr(x, y, M, 'unbiased');
		ryy = xcorr(y, y, M, 'unbiased');

		ryx = ryx(end-M:end);
		ryy = ryy(end-M:end);

		Ryy = toeplitz(ryy);
		w = inv(Ryy)*ryx';
	else
		% Implementación basada en solución
		% mínimos cuadrados
		% 
		% Suponiendo P = 2
		%   x[n] = w[0] y[n]   + w[1] y[n-1];
		% x[n-1] = w[0] y[n-1] + w[1] y[n-12;
		%
		%   x[1] = w[0] y[1]   + w[1] y[0];
		% 
		% Matricialmente x = Y w => w = ((Y' Y)^-1) Y' x = pinv(Y)*x

		Y = [];
		for p = 0:P-1
			Y = [Y y(end-p:-1:P-p).'];
		end

		Ryy = Y.'*Y./(length(x)-P);
		ryx = Y.'*x(end:-1:P).'/(length(x) - P);

		w = inv(Ryy)*ryx;
	end
end
