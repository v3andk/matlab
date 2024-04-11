function SP=Vobulat(Y,del,M);
%Вычисление на скользящем окне длиной l с шагом d последовательности
%оценок коэффициентов модели AR(2), центральной частоты и СКО
%На выходе получается матрица D (N2x4): первые 2 столбца - текущие значения
%коэффициентов, 3-й и 4-й - текущие значения СКО и центральной частоты,
%и матрица SP: ее столбцы - текущие значения СПМ
%===============================================
N=length(Y);    
l=50;  d=floor(N/40);                     %задание параметров окна
Nyq=1/2/del/d;
Nw=ceil((N-2*l-2)/d);                     %длина последовательности оценок

for k=1:Nw; 
    k1=(k-1)*d;
    y1=Y(k1+1:k1+2*l+1);  y=y1-mean(y1);  %скользящее оено
F1=fft(y);
F=abs(F1(1:floor(length(F1)/2+1))).^2;
teta = ar_1(F,2);                         %fft аппроксимируется AR(2)  
S=ar_spec(teta,M+1);  
s=sum(S)*Nyq/M;
D(k,1:2)=teta;  D(k,3)=std(y);
G=teta(1)*(teta(2)-1)/4/teta(2);   
if G>1; f0=0;  elseif G<-1;  f0=Nyq; else f0=1/pi*acos(G)*Nyq*d;   
end;
D(k,4)=f0;  SP(:,k)=S/s*D(k,3)^2;
end;

t_1=linspace(l/2,Nw*d,Nw);  t_1=t_1*del;
hF4=figure; 
set(hF4,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);

subplot(221); plot(t_1',D(:,1),'LineWidth',3); grid;
title('Вобуляция а1','FontName','Courier New Cyr','FontSize',14);
axis([0 Nw*d*del min(D(:,1))-0.05 max(D(:,1))+0.05]);

subplot(222); plot(t_1',D(:,2),'LineWidth',3); grid;
axis([0 Nw*d*del min(D(:,2))-0.05 max(D(:,2))+0.05]);
title('Вобуляция а2','FontName','Courier New Cyr','FontSize',14);

subplot(223); plot(t_1',D(:,3),'LineWidth',3); grid;
title('Вобуляция СКО','FontName','Courier New Cyr','FontSize',14);
axis([0 Nw*d*del min(D(:,3))-0.05 max(D(:,3))+0.05]);
xlabel('Время (с)','FontName','Courier New Cyr','FontSize',14);

subplot(224); plot(t_1',D(:,4),'LineWidth',3); grid;
title('Вобуляция f0','FontName','Courier New Cyr','FontSize',14);
xlabel('Время (с)','FontName','Courier New Cyr','FontSize',14);
axis([0 Nw*d*del min(D(:,4))-10 max(D(:,4))+10]);