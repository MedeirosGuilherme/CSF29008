clc
clear all


Pt = 50;
Gt = 1;
Gr = 1;
c = 3e8;
fc = 900e6;
La = c/fc;
d = [0:1:100000];
L = 1;

Pr = (Pt*Gt*Gr*La^2)./(((4*3.14)^2).*(d.^2)*L);

PrdB = 10*log10(Pr/0.01);

figure(1);
subplot(2,1,1);
semilogx(d, PrdB, 'r');
title('Potência recebida em relação à distância');
grid on;


ylabel('Pr [dBm]');
xlabel('Distância [m]');

% Erro: Perda em relação à distância

ErrP = Pt./Pr;

subplot(2,1,2);
plot(d, ErrP);
grid on;
title('Perda de potência em relação à distância');
xlabel('Distância [m]');
ylabel('Pt/Pr');