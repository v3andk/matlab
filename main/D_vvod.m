ch1=get(check1,'Value');       %1 - переход к виброускорениям 
ch2=get(check2,'Value');       %1 - преобразование Гильберта  
ff=str2num(get(FF,'String'));  %исходная частота дискретизации
M=str2num(get(MM,'String'));   %число линий в спектре
rd=str2num(get(RD,'String'));  %коэффициент децимации
%====Выбор файла из меню====   
str0=get(hmenu,'String');
v0=get(hmenu,'Value');
FName=str0{v0}; pos=findstr(FName,'.'); 
xName=char(FName(1:pos-1));
ext=char(FName(pos+1:pos+3));
if strcmp(ext,'wav')==1;
    XName=[path_my,xName];
    X=audioread(char(XName));
else
    eval(['load ',path_my,xName,' X']);
end;
X=decimate(X,rd);    %децимация
del=1/ff*rd;         %новая частота дискретизации
[N,m]=size(X); 
if ch1==1; X=diff(X); X(N,:)=mean(X);
end;
if ch2==1; X=abs(hilbert(X));
end; 

