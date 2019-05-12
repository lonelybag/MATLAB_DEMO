function new_model
sys = 'Testcase1';
new_system(sys) % 创建模型
open_system(sys) % 打开模型

x = 300;
y = 30;
w = 30;
h = 30;
offset = 60;
pos = [x y+h/4 x+w y+h*.75];
Out1Name='/VehSpeed'
add_block('built-in/Outport',[sys Out1Name],'Position',pos);
% 创建一个名为VehSpd的输出端口
x=x-200;
pos = [x y x+w y+h];
Source1Name='/SinWave';
add_block('built-in/Sin',[sys Source1Name],'Position',pos);
%创建一个名为Sinwave的正弦波信号源
add_line(sys,'SinWave/1','VehSpeed/1','autorouting','on');
%连接输出端口与信号源