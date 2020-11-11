clc
clear all
close all

Pt = 50;
Gt = 1;
Gr = 1;
d = [0:1:100000];
ht = 50;
hr = 3;

Pr = (Pt*Gt*Gr).*((ht^2*hr^2)./d.^4);

PrdB = 10*log10(Pr/0.01);

figure(1);
subplot(2,1,1);
semilogx(d, PrdB, 'r');
grid on;
title('Potência recebida em relação à distância');

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