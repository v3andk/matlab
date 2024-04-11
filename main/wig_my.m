function wig_my(Y,ff,fL,fU,flg);

N=200;
y=Y(1:N);
del=1/ff;
T=(N-1)*del;
t=0:del:T;

M=256;
hF8=figure; 
set(hF8,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
   if flg==0;
[wx,waxis]=wig2(y,2*M,1); 
   else
[wx,waxis]=wig2c(y,2*M,1);
   end;
WX=abs(fliplr(wx));
wxx=max(WX);
[wxm,I]=max(wxx);
nyq=(fU+fL)*M/max(I);
f=linspace(0,nyq,2*M);
J=find(f<=ff/2);

subplot(1,2,1);
mesh(f(J),t,WX(:,J)); grid; box;
title('ÝÑÏÌ','FontName','Courier New Cyr','FontSize',14);
xlabel('×àñòîòà (Ãö)','FontName','Courier New Cyr','FontSize',14);
ylabel('Âðåìÿ (ñ)','FontName','Courier New Cyr','FontSize',14);
zlabel('ÝÑÏÌ (ìÂ)','FontName','Courier New Cyr','FontSize',14);
axis([0 ff/2 0 T 0 max(max(WX))]);

subplot(1,2,2);
contour(f(J),t,WX(:,J),20); grid; axis([0 ff/2 0 T]);
title('Ëèíèè óðîâíÿ ÝÑÏÌ','FontName','Courier New Cyr','FontSize',14);
xlabel('×àñòîòà (Ãö)','FontName','Courier New Cyr','FontSize',14);
ylabel('Âðåìÿ (ñ)','FontName','Courier New Cyr','FontSize',14);


