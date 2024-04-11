function D_0(X,M,del);
[m,n]=size(X);             N=m*n;
z=reshape(X,N,1);   %преобразование ряда в столбец
%Ограничение выводимого отрезка ряда
if N>1000; N1=1000; else N1=N; end;

Nyquist=1/2/del;               %частота Найквиста
T=N1*del; t=linspace(0,T,N1);  %шкала времени

hF2=figure; 
set(hF2,'Units','Normalized','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
S0=pspectrum(z);       
f=linspace(0,Nyquist,length(S0));     %шкала частот
%S0=pwelch(z,[],[],[],2*M);     
s=sum(S0(:,1))*Nyquist/M; S0=S0(:,1)/s*cov(z);
subplot(211); plot(t',z(1:N1)); grid;
title('Временной ряд данных и его СПМ','FontName','Courier New Cyr',...
    'FontSize',14);
xlabel('Время (с)','FontName','Courier New Cyr','FontSize',14);
ylabel('Сигнал (мВ)','FontName','Courier New Cyr','FontSize',14); 
axis([0 T 1.1*min(z) 1.1*max(z)]);
subplot(212); plot(f',S0,'LineWidth',3);  grid;
xlabel('Частота (Гц)','FontName','Courier New Cyr','FontSize',14); 
ylabel('СПМ (мВ^2)','FontName','Courier New Cyr','FontSize',14); 
axis([0 Nyquist 0 1.1*max(S0)]);