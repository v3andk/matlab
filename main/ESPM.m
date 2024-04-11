function ESPM(Y,SP,fL,fU,del,flg);
%���������������� ���. flg=0 - �����������, flg=1 - ����� ������
N=length(Y);
[n,m]=size(SP);  %[101,40] 
Nyq=1/2/del; T=N*del;
t=linspace(0,T,m); 
f=linspace(0,Nyq,n);
hF6=figure; 
set(hF6,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
if flg==0;
surf(f,t,SP'); grid; box on;
axis([0 Nyq 0 T 0 max(max(SP))]);
title('���� � ��������� [fL,fU]','FontName','Courier New Cyr','FontSize',14);
xlabel('������� (��)','FontName','Courier New Cyr','FontSize',14); 
ylabel('����� (�)','FontName','Courier New Cyr','FontSize',14);
zlabel('���� (��)','FontName','Courier New Cyr','FontSize',14);
else
contour(f,t,SP',30); grid; box;
title('���� � ��������� [fL,fU]','FontName','Courier New Cyr','FontSize',14);
xlabel('������� (��)','FontName','Courier New Cyr','FontSize',14); 
ylabel('����� (�)','FontName','Courier New Cyr','FontSize',14);
end;