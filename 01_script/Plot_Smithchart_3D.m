function Plot_Smithchart_3D
%% 
% ���ñ���ӳ����Ƶ�Smithchart���ڱ׶ˣ���������Զ�����պ�
% ��ˣ����ű���ȡԲ���̵Ļ��Ʒ���
%% 3D
fig2 = figure(2) ;
fig2.Color = [1 1 1] ;
hold on
%% �ȵ�����
theta_r = linspace(0 , 2*pi , 1000) ;
r = linspace(-5 , 5 , 20) ;
rlength = length(r) ;

for i = 1 : 1 : rlength
    rr = r(i) ;
    real_offset = rr ./ (rr + 1) ;
    R = 1 ./ (rr + 1) ;
    Gamma_real = R .* cos(theta_r)  + real_offset;
    Gamma_imag = R .* sin(theta_r) ;
    
    Gamma_ABS = (1 + (abs(Gamma_real + 1j .* Gamma_imag)) .^2) ;
    x = 2 .* Gamma_real ./ Gamma_ABS ;
    y = 2 .* Gamma_imag ./ Gamma_ABS ;
    z = (1 - (abs(Gamma_real + 1j .* Gamma_imag)) .^2 ) ./ Gamma_ABS ;

    h1 = plot3(x , y , z) ;
    h1.Color = [1 0 0] ;
    h1.LineWidth = 1.3 ;
end
%% �ȵ翹��
theta_x = linspace(0 , 2*pi , 1000) ;
x = linspace(-5 , 5 , 25) ;
xlength = length(x) ;
for i = 1 : 1 : xlength
    xx = x(i) ;
    real_offset = 1 ;
    imag_offset = 1 ./ xx ;
    R = 1 ./ xx ;
    Gamma_real = R .* cos(theta_x)  + real_offset;
    Gamma_imag = R .* sin(theta_x) + imag_offset;
    
    Gamma_ABS = (1 + (abs(Gamma_real + 1j .* Gamma_imag)) .^2) ;
    x_x = 2 .* Gamma_real ./ Gamma_ABS ;
    x_y = 2 .* Gamma_imag ./ Gamma_ABS ;
    x_z = (1 - (abs(Gamma_real + 1j .* Gamma_imag)) .^2 ) ./ Gamma_ABS ;

    h1 = plot3(x_x ,x_y , x_z) ;
    h1.Color = [0 0 1] ;
    h1.LineWidth = 1.3 ;
    h1.LineStyle = '--' ;
end
axis off
%% ����
[x,y,z] = sphere;
s1 = surf(x,y,z) ;
% s1.FaceColor = [0.831 0.816 0.784] ;
s1.FaceColor = [1 1 1] ;
s1.EdgeColor = [0.494 0.494 0.494] ;

%% ע��
text(0 , 0 , 1.1 ,'North Pole','FontSize',15);
text(0 , 0 , -1.1 ,'South Pole','FontSize',15);
%%
rotate3d % �̶�������
axis(gca,'vis3d'); % �̶�������
%% �ı���
a = get(fig2 , 'Position') ;
a = a(4) ;
str = {'�� - �ȵ���Բ','�� - �ȵ翹Բ'};
an1 = annotation('textbox','String',str);
an1.Units = 'Pixels' ;
an1.Position = [0  a-33.75 90.75 33.75] ;
an1.FitBoxToText = 'on' ;
