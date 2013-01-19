clear all;
close all;

load s3.mat;

disp 'Parte 4'
disp '- Apartado 1'

N = length(z);
fs = 1000;
%df = fs/N;
%f = [ -(ceil((N-1)/2):-1:1)*df 0 (1:floor((N-1)/2))*df ];
%y = fftshift(abs(fft(z)));
%disp 'frecuencias'
%plot(f, y);
%f(y > 500000)

disp '- Apartado 2'

freqs = [5, 200, 400];
n = 0:N-1;

%Construir la matriz H
H = [];
for f = 1:length(freqs)
	H = [H sin(2*pi*freqs(f)*n/fs)' cos(2*pi*freqs(f)*n/fs)'];
end

%Resolver por mínimos cuadrados el sistema H w = z
w = pinv(H)*z';

%Obtener las amplitudes y las fases
w = reshape(w, 2, length(freqs));
amps = [];
phases = [];
for f = 1:length(freqs)
	amps = [amps norm(w(:,f))];
	phases = [phases atan(w(2,f)/w(1,f))];
end


s1 = amps(1)*sin(2*pi*freqs(1)*n/fs + phases(1));
s2 = amps(2)*sin(2*pi*freqs(2)*n/fs + phases(2));
s3 = amps(3)*sin(2*pi*freqs(3)*n/fs + phases(3));

s = s1 + s2 + s3;
plot((z-s)(1:1000));
var(z-s)

ecm(z,s)

