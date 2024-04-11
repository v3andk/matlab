function bispec_my(Y,ff);
N=length(Y); y=Y(1:N); M=256;

hF9=figure; 
set(hF9,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
bspec=bispeci(y,21,2*M,0,'unbiased',2*M,1);
BSPEC=abs(bspec(M+1:2*M,M+1:2*M));
f=linspace(0,ff/2,M);

subplot(1,2,1);
mesh(f,f,BSPEC); grid on; box;
title('Ѕиспектр','FontName','Courier New Cyr','FontSize',14);
xlabel('f1 (√ц)','FontName','Courier New Cyr','FontSize',14);
ylabel('f2 (√ц)','FontName','Courier New Cyr','FontSize',14);
zlabel('Ѕиспектр (м¬)','FontName','Courier New Cyr','FontSize',14);
axis([0 ff/2 0 ff/2 0 max(max(BSPEC))]);
subplot(1,2,2);
contour(f,f,BSPEC,20); grid; axis([0 ff/2 0 ff/2]);
title('Ћинии уровн€','FontName','Courier New Cyr','FontSize',14);
xlabel('f1 (√ц)','FontName','Courier New Cyr','FontSize',14);
ylabel('f2 (√ц)','FontName','Courier New Cyr','FontSize',14);






