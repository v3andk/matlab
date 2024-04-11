function [a,fi]=fit_1(B,delta,d,flag);
%Подгонка фигуры Лиссажу к процессу вобуляции коэффициентов модели AR(2)

[m,n]=size(B); M=min(m,n); N=max(m,n); B=reshape(B,N,M);
T=N*delta*d;

t=T/N:T/N:T;
Nyq=1/2/d/delta;
m=50;
%S11=spectrum(B(:,1));     %СПМ процессов вобуляции коэффициентов
%S21=spectrum(B(:,2));     %модели AR(2)
%S1=S11(:,1); S2=S21(:,1);
S1=pwelch(B(:,1));     %СПМ процессов вобуляции коэффициентов
S2=pwelch(B(:,2));     %модели AR(2)

f=linspace(0,Nyq,length(S1));    %шкала частот

[s2,I2]=max(S2);              %нахождение частот,сответствующих
[s1,I1]=max(S1);              %максимумам СПМ, и их округление
F1=Nyq/m*(min(I1)-1);
F2=Nyq/m*(min(I2)-1);
if F1>=F2;
     f2=round(F2*2)/2; f1=f2*round(F1/F2);
else f1=round(F1*2)/2; f2=f1*round(F2/F1);
end;

for k=1:N;
Q1(k,:)=[1 cos(2*pi*f1*t(k)) -sin(2*pi*f1*t(k))];
Q2(k,:)=[1 cos(2*pi*f2*t(k)) -sin(2*pi*f2*t(k))];
end;

%Оценивание коэффициентов модели
teta1=inv(Q1'*Q1+0.002)*Q1'*B(:,1);
teta2=inv(Q2'*Q2+0.002)*Q2'*B(:,2);
a1=teta1(1);                                 %центр фигуры Лиссажу
a2=teta2(1);         a=[a1;a2];
A1=sqrt(teta1(2)^2+teta1(3)^2);              %амплитуда а
A2=sqrt(teta2(2)^2+teta2(3)^2);              %амплитуда b
A1=std(B(:,1));
A2=std(B(:,2));
fi1=atan(teta1(3)/teta1(2));                 %начальная фаза
fi2=atan(teta2(3)/teta2(2));

y0(1,:)=A1*cos(2*pi*f1*t+fi1);               %Оцененные процессы вобуляции
y0(2,:)=A2*cos(2*pi*f2*t+fi2);               %коэффициентов
y(1,:)=y0(1,:)+a1;
y(2,:)=y0(2,:)+a2;

fi0=linspace(0,2*pi,N);                      %угол поворота фигуры Лиссажу
for k=1:N;
fi=fi0(k);
C=[ cos(fi) sin(fi)
   -sin(fi) cos(fi)];
z=C*y0;
z(1,:)=z(1,:)+a1;
z(2,:)=z(2,:)+a2;
Q(k)=norm(z-B','fro');
end;
[q,i]=min(Q);
fi=fi0(min(i));                                   %поворот фигуры Лиссажу
C=[ cos(fi) sin(fi)
   -sin(fi) cos(fi)];
z=C*y0;
S1=sqrt(S1);  S2=sqrt(S2);

hF7=figure; 
set(hF7,'Units','Norm','Pos',[0.3 0.285 0.68 0.48],'Color',[0.8 0.8 0.8]);

subplot(221); plot(t',B(:,1),'LineWidth',2);
hold on; plot(t,y(1,:)-3*A1,'m','LineWidth',1); grid;
title('a1 и его оценка','FontName','Courier New Cyr','FontSize',14);
%axis([0 T (min(y(1,:))-3*A1-0.05) max(B(:,1))+0.05]);

subplot(222); plot(t',B(:,2),'LineWidth',2);
hold on; plot(t,y(2,:)-4*A2,'m','LineWidth',1); grid;
title('а2 и его оценка','FontName','Courier New Cyr','FontSize',14);

subplot(223); plot(f(1:20)',S1(1:20),'LineWidth',3);
hold on; plot(f(1:20)',S2(1:20)+max(S1),'m','LineWidth',3); grid;
title('   СПМ коэффициентов','FontName','Courier New Cyr','FontSize',14);
%axis([0 60 0 max(max([S1 S2]))*2.1]);
legend(['f1=',int2str(f1),' Gz'],['f2=',int2str(f2),' Gz']);

subplot(224);
if flag==0;
u1=min(a1+z(1,:)); v1=max(a1+z(1,:));
u2=min(a2+z(2,:)); v2=max(a2+z(2,:));
plot(a1+z(1,:),a2+z(2,:),'m','LineWidth',2); grid;
title('Вобуляция коэффициентов','FontName','Courier New Cyr','FontSize',14);
%axis([u1-0.1 v1+0.1 u2-0.1 v2+0.1]);
else
P1=smooth0(B(:,1),0.03);
P2=smooth0(B(:,2),0.03);
plot(B(:,1),B(:,2),'xm','LineWidth',2);
hold on; plot(P1,P2,'g','LineWidth',2); grid;
title('Вобуляция коэффициентов','FontName','Courier New Cyr','FontSize',14);
end;
