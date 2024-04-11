function specgram_my(Y,fL,fU);
%Cпектрограмма отфильтрованного ряда
%N=length(Y); Nyq=ff/2;  T=1/ff*N;
%B=specgram(Y,K,ff);
%[n,m]=size(B);
%t=linspace(0,T,m);
%f=linspace(0,Nyq,n);
%hF5=figure; 
%set(hF5,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
%contour(f,t,abs(B'),10); grid; 
%mesh(f,t,abs(B')); grid; box;

hF5=figure; 
set(hF5,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]);
[S,F,T]=spectrogram(Y,32,30,256,0.001);
    mesh(T,F,abs(S));  box;  view(-45,65);
ylabel('Частота (Гц)','FontName','Courier New Cyr','FontSize',14);
xlabel('Время (с)','FontName','Courier New Cyr','FontSize',14);
zlabel('СПМ (мВ)','FontName','Courier New Cyr','FontSize',14);
%axis([0 T fL fU 0 max( max(abs(S)) )]);    
    
    
