function D_0(X,M,del);
[m,n]=size(X);             N=m*n;
z=reshape(X,N,1);   %�������������� ���� � �������
%����������� ���������� ������� ����
if N>1000; N1=1000; else N1=N; end;

Nyquist=1/2/del;               %������� ���������
T=N1*del; t=linspace(0,T,N1);  %����� �������

hF2=figure; 
set(hF2,'Units','Normalized','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
S0=pspectrum(z);       
f=linspace(0,Nyquist,length(S0));     %����� ������
%S0=pwelch(z,[],[],[],2*M);     
s=sum(S0(:,1))*Nyquist/M; S0=S0(:,1)/s*cov(z);
subplot(211); plot(t',z(1:N1)); grid;
title('��������� ��� ������ � ��� ���','FontName','Courier New Cyr',...
    'FontSize',14);
xlabel('����� (�)','FontName','Courier New Cyr','FontSize',14);
ylabel('������ (��)','FontName','Courier New Cyr','FontSize',14); 
axis([0 T 1.1*min(z) 1.1*max(z)]);
subplot(212); plot(f',S0,'LineWidth',3);  grid;
xlabel('������� (��)','FontName','Courier New Cyr','FontSize',14); 
ylabel('��� (��^2)','FontName','Courier New Cyr','FontSize',14); 
axis([0 Nyquist 0 1.1*max(S0)]);