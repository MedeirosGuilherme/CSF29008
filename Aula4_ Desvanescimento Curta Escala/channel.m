clc
clear all
close all

h = rayleighchan(1/10000,200, [0 1 2 3 4 5 6 7 8 9]*1e-6, [0 0 0 0 0 0 0 0 0 0]);
tx = randint(100000,1,2);
dpskSig = dpskmod(tx,2);
h.StoreHistory = 1;
y = filter(h,dpskSig);
plot(h);