function pFinal

	clear all;

	load s1.mat;
	load s2.mat;

	x = filter([0 1], 1, y );
	P = 3


	

	% Devuelve un vector con los P coeficientes del
	% filtro de Wiener tal que x[n] =~ w[n] * p[n]
	%
	% El parámetro impl permite elegir entre una
	% implementación según las ecuaciones de Wiener-Hopfs
	% (impl='wienerhopfs', por defecto) 
	% y una basada en solución mínimos cuadrados
	% (impl='ls'.
	%
	function [w Ryy ryx] = wiener(y, x, P, impl)
		if(nargin < 4 or impl='wienerhopfs'){
		% Implementación basada en las ecuaciones
		% de Wiener-Hopfs
			M = P - 1;
			
			rxy = xcorr(x, y, M, 'unbiased');
			ryy = xcorr(y, y, M, 'unbiased');

			rxy = rxy(end-M:end)
			ryy = ryy(end-M:end)

			Ryy = toeplitz(ryy)
			w = inv(Ryy)*rxy';
		}
		else{
		% Implementación basada en las ecuaciones
		% de Wiener-Hopfs

		}
	end
end
