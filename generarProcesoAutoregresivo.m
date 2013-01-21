%%
% José Ramón Álvarez Rojo 100038962@alumnos.uc3m.es
% Javier García Zurdo     jgzurdo@pa.uc3m.es
% Daniel Ruesga Ibáñez    100071034@alumnos.uc3m.es
%
% Diciembre de 2013
%
function x = generarProcesoAutoregresivo(coefs, N, sigma)

%Forzar a que coefs sea columna
coefs = coefs(:);

% Método 1:  a partir de la expresión del proceso
%-----------------------------------------------
%p = length(coefs);
%x = zeros(1, N + p);

%for n = 1+p : N+p
%	x(n) = x(n-p:n-1)*coefs +  sigma*randn(1,1);
%end

%x = x(p+1:end);

%end

% Método 2: filtrando ruido
e = sigma*randn(N,1);
x = filter(1, [1, -coefs'], e); 
