clear; clc;
load('Ascold_4_600','X');
S=pspectrum(X*10^3);
S_log=log(S);

      subplot(311);
      plot(S(1:4000),'LineWidth',2); grid; 
ylabel('СПМ (мВ^2)','FontSize',14,'FontWeight','Bold');
title('а) Спектральная плотность мощности','FontSize',16,'FontWeight','Bold');
      subplot(312);
plot(S_log(1:4000),'LineWidth',2); grid;
xlabel('Частота (Гц)','FontSize',14,'FontWeight','Bold');
ylabel('Логарифмическая СПМ','FontSize',14,'FontWeight','Bold');
%figure;
      subplot(313);
H=abs(ifft(S_log));    %length(H)=4096   
M=300;    H1=H.^2;
plot(H1(10:M),'LineWidth',2); grid;
xlabel('Кепстральное время (Квефренция)','FontSize',14,'FontWeight','Bold');
ylabel('Гамнитуда','FontSize',14,'FontWeight','Bold');
title('б) Кепстр','FontSize',14,'FontWeight','Bold');

