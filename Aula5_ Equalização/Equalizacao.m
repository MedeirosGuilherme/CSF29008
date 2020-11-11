clc
clear all
close all

info = randi(2,1,1000000)-1;

Rs = 10e3;
s = pskmod(info, 4); % MODULAÇÃO QPSK

h = rayleighchan(1/Rs,100);%, [0]*1e-6, [0]); % CRIANDO AS CARACTERÍSTICAS DO SINAL RAYLEIGH COM UM CURSO APENAS (FALTA PARAMETRO 3 E 4)
h.StoreHistory = 1; %   ARMAZENANDO O HISTORICO DO h

signalRay = filter(h,s);    % PASSANDO O SINAL PELO CANAL, SISTEMA LINEAR INVARIANTE NO TEMPO

SNRmin = 0;
SNRmax = 50;

for SNR = SNRmin:SNRmax
    r = awgn(signalRay,SNR);            % LAÇO DO CANAL
    rEq = r./transpose(h.pathgains);    % DIVIDINDO PELOS VALORES DE VARIAÇÃO DE MULTIPERCURSO (EQUALIZAÇÃO)!!!
    infoDemod = pskdemod(rEq,4);
    [n,rate]= symerr(infoDemod, info);
    numErr(SNR+1) = n;
    taxaErr(SNR+1) = rate;
end

for SNR = SNRmin:SNRmax
    r = awgn(s, SNR);                   % LAÇO SEM CANAL, APENAS AWGN
    infoDemod = pskdemod(r, 4);
    [n, rate] = symerr(infoDemod, info);
    numRErr(SNR+1) = n;
    taxaRERR(SNR+1) = rate;
end

figure(1);
semilogy([SNRmin:SNRmax], taxaErr);
xlabel('SNR');
ylabel('Taxa de Erro');
grid on;
title('Comparação da Taxa de Erro entre canal AWGN e canal RayLeigh');
hold on
semilogy([SNRmin:SNRmax], taxaRERR);
legend('ReyLeigh', 'AWGN');



