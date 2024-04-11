clear;clc;
Z=wavread('J4');
n=length(Z); m=floor(n/100);
Y=reshape(Z(1:100*m),100,m); Y=Y/10;
X=sum(Y);
%X=Y(1,:);
%plot(X); grid;
save Asc_4_100 X;