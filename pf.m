
clear all;

load s1.mat;
load s2.mat;

x = filter([0 1], 1, y );
P = 3
w = wiener(y, x, P)
w = wiener(y, x, P, 'ls')

	
