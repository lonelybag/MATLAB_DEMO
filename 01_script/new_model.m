function new_model
sys = 'Testcase1';
new_system(sys) % ����ģ��
open_system(sys) % ��ģ��

x = 300;
y = 30;
w = 30;
h = 30;
offset = 60;
pos = [x y+h/4 x+w y+h*.75];
Out1Name='/VehSpeed'
add_block('built-in/Outport',[sys Out1Name],'Position',pos);
% ����һ����ΪVehSpd������˿�
x=x-200;
pos = [x y x+w y+h];
Source1Name='/SinWave';
add_block('built-in/Sin',[sys Source1Name],'Position',pos);
%����һ����ΪSinwave�����Ҳ��ź�Դ
add_line(sys,'SinWave/1','VehSpeed/1','autorouting','on');
%��������˿����ź�Դ