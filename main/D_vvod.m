ch1=get(check1,'Value');       %1 - ������� � ��������������� 
ch2=get(check2,'Value');       %1 - �������������� ���������  
ff=str2num(get(FF,'String'));  %�������� ������� �������������
M=str2num(get(MM,'String'));   %����� ����� � �������
rd=str2num(get(RD,'String'));  %����������� ���������
%====����� ����� �� ����====   
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
X=decimate(X,rd);    %���������
del=1/ff*rd;         %����� ������� �������������
[N,m]=size(X); 
if ch1==1; X=diff(X); X(N,:)=mean(X);
end;
if ch2==1; X=abs(hilbert(X));
end; 

