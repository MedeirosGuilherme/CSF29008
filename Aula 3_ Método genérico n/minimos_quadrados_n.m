%Pag 93 do Rappaport

%% a)

clc
clear all
close all

do = 100;
d = [100 200 1000 3000];
P = [0 -20 -35 -70];
Po = 0;

%do = 2;
%Po = -52;
%d = [2 3 5 7 9 11 13 15 17];
%P = [-52 -55 -56 -6 -66 -78 -70 -80 -83];

syms n;
syms E;

E = Po - 10*n*log10(d/do);

Jaux = (P - E).^2;

J = sum(Jaux);

Jdiff = diff(J);

S = solve(Jdiff, n);
Seval = eval(S);


%% b)

% Sabendo que sigma = Sum(J(n)) para o n encontrado em Seval: Dividindo
% pelo número de amostras = 4

sigmaAux = eval(subs(J, 4.4));
sigmaSquared = sigmaAux/4;
sigma = sqrt(sigmaSquared);

%% c)

%Calcular o valor de potência para 2km fica fácil, daí, utilizando a
%equação inicial de potência estimada E = po - 10*n*log10(d/do);

E2000 = Po -10*4.4*log10(2000/do);


%% d) Calculando a probabilidade de valores acima de -60dBm

limiar = -60;
probAux = qfunc((limiar - E2000)/sigma);








