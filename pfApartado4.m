clear all;
close all;

load s3.mat;

disp 'Parte 4'
disp '- Apartado 1'

N = length(z);
fs = 1000;
df = fs/N;
f = [ -(ceil((N-1)/2):-1:1)*df 0 (1:floor((N-1)/2))*df ];
y = fftshift(abs(fft(z)));
disp 'frecuencias'
plot(f, y);
f(y > 500000)

