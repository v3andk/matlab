function ESPM(Y,SP,fL,fU,del,flg);
%Эволюционирующая СПМ. flg=0 - поверхность, flg=1 - линии уровня
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
title('ЭСПМ в диапазоне [fL,fU]','FontName','Courier New Cyr','FontSize',14);
xlabel('Частота (Гц)','FontName','Courier New Cyr','FontSize',14); 
ylabel('Время (с)','FontName','Courier New Cyr','FontSize',14);
zlabel('ЭСПМ (мВ)','FontName','Courier New Cyr','FontSize',14);
else
contour(f,t,SP',30); grid; box;
title('ЭСПМ в диапазоне [fL,fU]','FontName','Courier New Cyr','FontSize',14);
xlabel('Частота (Гц)','FontName','Courier New Cyr','FontSize',14); 
ylabel('Время (с)','FontName','Courier New Cyr','FontSize',14);
end;