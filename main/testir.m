function testir(Y);

[sg_1,sl_1]=glstat(Y,0.51,128);   %�������� �� �������� ����������
[sg_2,sl_2]=glstat(Y,0.51,256);   %�������� �� ������� ����������

hF10=figure; 
set(hF10,'Units','Norm','Pos',[0.3 0.265 0.68 0.425],'Color',[0.8 0.8 0.8]); axis off;

txt1='�� �������� ���������� �������� ����������� ';
txt2='�� ������� ���������� �������� ����������� ';
txt3='�� �������� ���������� �������� ���������� ';
txt4='�� ������� ���������� �������� ���������� ';
zakl1='�����������. ';
zakl2='�����������. ';
a='    ���������� ';
b='.   ����������� ������� ';

if sg_1(1)<=sg_1(2);
text(0,1,[txt1,zakl1],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.95,[a,num2str(sg_1(1)),b,num2str(sg_1(2))],'FontSize',12,'FontName','Courier New Cyr');
else   
text(0,1,[txt1,zakl2],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.95,[a,num2str(sg_1(1)),b,num2str(sg_1(2))],'FontSize',12,'FontName','Courier New Cyr');
end;

if sg_2(1)<=sg_2(2);
text(0,0.85,[txt2,zakl1],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.8,[a,num2str(sg_2(1)),b,num2str(sg_2(2))],'FontSize',12,'FontName','Courier New Cyr');
else   
text(0,0.85,[txt2,zakl2],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.8,[a,num2str(sg_2(1)),b,num2str(sg_2(2))],'FontSize',12,'FontName','Courier New Cyr');
end;

if sl_1(1)<=sl_1(3);
text(0,0.7,[txt3,zakl1],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.65,[a,num2str(sl_1(1)),b,num2str(sl_1(3))],'FontSize',12,'FontName','Courier New Cyr');
else   
text(0,0.7,[txt3,zakl2],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.65,[a,num2str(sl_1(1)),b,num2str(sl_1(2))],'FontSize',12,'FontName','Courier New Cyr');
end;

if sl_2(1)<=sl_2(3);
text(0,0.55,[txt4,zakl1],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.5,[a,num2str(sl_2(1)),b,num2str(sl_2(3))],'FontSize',12,'FontName','Courier New Cyr');
else   
text(0,0.55,[txt4,zakl2],'FontSize',12,'FontName','Courier New Cyr');
text(0,0.5,[a,num2str(sl_2(1)),b,num2str(sl_2(3))],'FontSize',12,'FontName','Courier New Cyr');
end;
