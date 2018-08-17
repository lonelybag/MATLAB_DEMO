function overcoupled
%% =========�㶨������㶨��ѹʱ�����ص���Է��䡢�ܹ��ʵȵ�Ӱ��=============
% 2017-11-17
% By DWH
%% �ű�
Us = 220 ;
Rs = 50 ;
Rl = linspace(0,500,10000) ;

I1 = Us./(Rs+Rl) ;
Ps = I1.^2.*Rs ;
Pl = I1.^2.*Rl ;
Ptotal = Us.^2./(Rs + Rl) ;

gamma = (Rl - Rs)./(Rl + Rs) ;
Pinc = 100  ;
Pref = Pinc.*gamma.^2 ;
Pin = (1-gamma.^2).*Pinc ;
%% ��ͼ
fig1 = figure(1) ;
fig1.Color = [1 1 1] ;

subplot(1,2,1)
plot(Rl,Pin)
hold on
plot(Rl,Pref)
xlabel('RL')
ylabel('Power')
plot(Rl,Pin+Pref)
title('���������[����] = Power �㶨����','Fontsize',15)
legend('Pin','Pref','Pinc');
rotate3d % �̶�������
axis(gca,'vis3d'); % �̶�������

subplot(1,2,2)
plot(Rl,Ps)
hold on
plot(Rl,Pl)
xlabel('RL')
ylabel('Power')
plot(Rl,Ptotal)
title('���������[����] = Power �㶨��ѹ','Fontsize',15)

legend('Ps','Pl','Ptotal');
% rotate3d % �̶�������
% axis(gca,'vis3d'); % �̶�������
%% ����ͼƬ��С
width = 1000 ;
height = 0.3*width ;
set(gcf, 'position', [200 200 width height]); % [x y width height]