function Y=Filt(X,M,del,fL,fU);
N=length(X);     p=6;    %порядок фильтра Баттеруорта
%Фильтрация 
Nyq=1/2/del;     %частота Найквиста
P=(fL+1)/Nyq;   Q=(fU-1)/Nyq;    %граничные частоты в процентах
[B1,A1]=butter(p,[P,Q]);         %коэффициенты фильтра Баттеруорта
Y=filter(B1,A1,X);               %выход фильтра
n=length(Y); Y=reshape(Y,n,1);

Sx=pspectrum(X);
s=sum(Sx(:,1))*Nyq/M; SX=Sx(:,1)/s*cov(X);
Sy=pspectrum(Y);
s=sum(Sy(:,1))*Nyq/M; SY=Sy(:,1)/s*cov(Y);
f=linspace(0,Nyq,length(Sx));     %шкала частот
%Ограничение выводимого отрезка ряда
if N>1000; N1=1000; else N1=N; end;              
T=N1*del; t=linspace(0,T,N1);  %шкала времени

hF3=figure; 
set(hF3,'Units','Normalized','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
subplot(211); plot(t',Y(1:N1)); grid;
title('Выход полосового фильтра и его СПМ',...
    'FontName','Courier New Cyr','FontSize',14);
xlabel('Время (с)','FontName','Courier New Cyr','FontSize',14);   
ylabel('Сигнал (мВ)','FontName','Courier New Cyr','FontSize',14);
axis([0 T 1.1*min(Y) 1.1*max(Y)]);

subplot(212); plot(f',SX,'LineWidth',2);
hold on; plot(f',SY,'g','LineWidth',3); grid;
xlabel('Частота (Гц)','FontName','Courier New Cyr','FontSize',14); 
ylabel('СПМ (мВ^2)','FontName','Courier New Cyr','FontSize',14);
axis([0 Nyq 0 1.1*max(SX)]);