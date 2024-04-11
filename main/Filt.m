function Y=Filt(X,M,del,fL,fU);
N=length(X);     p=6;    %������� ������� �����������
%���������� 
Nyq=1/2/del;     %������� ���������
P=(fL+1)/Nyq;   Q=(fU-1)/Nyq;    %��������� ������� � ���������
[B1,A1]=butter(p,[P,Q]);         %������������ ������� �����������
Y=filter(B1,A1,X);               %����� �������
n=length(Y); Y=reshape(Y,n,1);

Sx=pspectrum(X);
s=sum(Sx(:,1))*Nyq/M; SX=Sx(:,1)/s*cov(X);
Sy=pspectrum(Y);
s=sum(Sy(:,1))*Nyq/M; SY=Sy(:,1)/s*cov(Y);
f=linspace(0,Nyq,length(Sx));     %����� ������
%����������� ���������� ������� ����
if N>1000; N1=1000; else N1=N; end;              
T=N1*del; t=linspace(0,T,N1);  %����� �������

hF3=figure; 
set(hF3,'Units','Normalized','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
subplot(211); plot(t',Y(1:N1)); grid;
title('����� ���������� ������� � ��� ���',...
    'FontName','Courier New Cyr','FontSize',14);
xlabel('����� (�)','FontName','Courier New Cyr','FontSize',14);   
ylabel('������ (��)','FontName','Courier New Cyr','FontSize',14);
axis([0 T 1.1*min(Y) 1.1*max(Y)]);

subplot(212); plot(f',SX,'LineWidth',2);
hold on; plot(f',SY,'g','LineWidth',3); grid;
xlabel('������� (��)','FontName','Courier New Cyr','FontSize',14); 
ylabel('��� (��^2)','FontName','Courier New Cyr','FontSize',14);
axis([0 Nyq 0 1.1*max(SX)]);