function a = levinsonDurbinRec(r)

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
