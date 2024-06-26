clear; clc;
hF1=figure; 
set(hF1,'Units','Normalized','Pos',[0 0.06 1 1.1],'Color',[0.8 0.8 0.8]);
%����� ���������
uicontrol(hF1,'Style','text','Units','Normalized',...
   'Pos',[0.03 0.9 0.935 0.09],'String','�������',...
   'Back',[0.8 0.8 0.8],'Hor','center','FontSize',40,'FontWeight','Bold');
uicontrol(hF1,'Style','text','Units','Normalized',...
   'Position',[0.03 0.84 0.935 0.05],...
   'String','������� ������� ����������������� ��������',...
   'Back',[0.8 0.8 0.8],'Hor','center','FontSize',20);
%����� ������ ����������� ����
uicontrol(hF1,'Style','Frame','Units','Norm',...
   'Pos',[0.03 0.425 0.25 0.405],'Back',[1 1 1]);
uicontrol(hF1,'Style','text','Units','Norm',...
   'Pos',[0.045 0.78 0.22 0.04],'String','���������� ����',...
   'Back',[1 1 1],'Hor','center','FontSize',20);
%���������� ����
path_my='c:\Dyachron_dat\'; b=dir(path_my); str={b.name};
hmenu=uicontrol(hF1,'Style','Popupmenu','Units','Norm',...
   'Pos',[0.045 0.62 0.225 0.15],'String',str,'Hor','left');

%��������������� ��������� �������
check1=uicontrol('Style','Checkbox','Units','Norm',...
    'Back',[1 1 1]*0.8,'Fore',[0 0 0],'String','������� � ���������������',...
    'FontSize',14,'Pos',[0.045 0.37 0.25 0.05]);
check2=uicontrol('Style','Checkbox','Units','Norm',...
    'Back',[1 1 1]*0.8,'Fore',[0 0 0],'String','�������������� ���������',...
    'FontSize',14,'Pos',[0.045 0.32 0.25 0.05]);
%������� �������������,����������� ��������� � ����� ������������ ������������
uicontrol(hF1,'Style','text','Units','Norm',...
   'Pos',[0.03 0.27 0.27 0.04],'String','������� �������������',...
   'Back',[1 1 1]*0.8,'Hor','Left','FontSize',13);
FF=uicontrol(hF1,'Style','edit','Units','Norm','FontSize',13,...
   'Pos',[0.22 0.28 0.06 0.03],'String','22050','Back',[1 1 1]*0.8,'Hor','center');
uicontrol(hF1,'Style','text','Units','Norm',...
   'Pos',[0.03 0.22 0.27 0.04],'String','����������� ���������',...
   'Back',[1 1 1]*0.8,'Hor','Left','FontSize',13);
RD=uicontrol(hF1,'Style','edit','Units','Norm','FontSize',13,...
   'Pos',[0.22 0.23 0.06 0.03],'String','20','Back',[1 1 1]*0.8,'Hor','center');
uicontrol(hF1,'Style','text','Units','Norm',...
   'Pos',[0.03 0.175 0.27 0.04],'String','����� ����� � ���',...
   'Back',[1 1 1]*0.8,'Hor','Left','FontSize',13);
MM=uicontrol(hF1,'Style','edit','Units','Norm','FontSize',13,...
   'Pos',[0.22 0.185 0.06 0.03],'String','128','Back',[1 1 1]*0.8,'Hor','center');
%���� ������
uicontrol(hF1,'Style','Pushbutton','Units','Norm',...
   'String','���� ������','Back',[0.9 0.9 0.9],'FontSize',14,...
   'Pos',[0.03 0.125 0.25 0.045],'Hor','center', 'Call','D_vvod;');
%������������� � ����������
uicontrol(hF1,'Style','Pushbutton','Units','Norm',...
   'String','�������� ��������������','Back',[0.9 0.9 0.9],'FontSize',13,...
   'Pos',[0.03 0.075 0.25 0.04],'Hor','center', 'Call','D_0(X,M,del);');
uicontrol(hF1,'Style','text','Units','Norm',...
   'Pos',[0.3 0.17 0.13 0.04],'String','������ �������',...
   'Back',[1 1 1]*0.8,'Hor','Left','FontSize',13);
FL=uicontrol(hF1,'Style','edit','Units','Norm','FontSize',13,...
   'Pos',[0.43 0.18 0.06 0.03],'String','300','Back',[1 1 1]*0.8,'Hor','center');
uicontrol(hF1,'Style','text','Units','Norm',...
   'Pos',[0.3 0.12 0.13 0.04],'String','������� �������',...
   'Back',[1 1 1]*0.8,'Hor','Left','FontSize',13);
FU=uicontrol(hF1,'Style','edit','Units','Norm','FontSize',13,...
   'Pos',[0.43 0.13 0.06 0.03],'String','350','Back',[1 1 1]*0.8,'Hor','center');
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','����������','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.3 0.075 0.19 0.04],'Hor','center', 'Call','Filt_0;');
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','�����','Back',[0.9 0.9 0.9],'FontSize',13,...
   'Pos',[0.03 0.02 0.25 0.04],'Hor','center','Call','close all');
%���������� ����������� �������
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','�������������','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.3 0.02 0.19 0.04],'Hor','center', 'Call',...
   'specgram_my(Y,2*M,ff);');
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','���������','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.51 0.175 0.2 0.04],'Hor','center', 'Call','SP=Vobulat(Y,del,M);');
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','����','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.51 0.125 0.2 0.04],'Hor','center', 'Call','ESPM(Y,SP,del,fL,fU,0);');
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','����� ������ ����','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.51 0.075 0.2 0.04],'Hor','center', 'Call','ESPM(Y,SP,del,fL,fU,1);');
uicontrol(hF1,'Style','Push','Units','Norm',...
   'String','������ ����� �� �����','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.51 0.02 0.2 0.04],'Hor','center', 'Call','c_de_f(Y,del)');

%������ ������ ��������
uicontrol(hF1,'Style','Pushbutton','Units','Norm',...
   'String','�������������� �������-�����','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.73 0.175 0.25 0.04],'Hor','center', 'Call','wig_my(Y,ff,fL,fU,0)');
uicontrol(hF1,'Style','Pushbutton','Units','Norm',...
   'String','�������������� ���-��������','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.73 0.125 0.25 0.04],'Hor','center', 'Call','wig_my(Y,ff,fL,fU,1)');
uicontrol(hF1,'Style','Pushbutton','Units','Norm',...
   'String','��������','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.73 0.075 0.25 0.04],'Hor','center', 'Call','Bispec_my(Y,ff)');
uicontrol(hF1,'Style','Pushbutton','Units','Norm',...
   'String','������������','Back',[1 1 1]*0.9,'FontSize',13,...
   'Pos',[0.73 0.025 0.25 0.04],'Hor','center', 'Call','testir(Y)');













