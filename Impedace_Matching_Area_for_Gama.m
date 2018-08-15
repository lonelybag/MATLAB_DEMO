function Impedace_Matching_Area_for_Gama
%% =======针对特定匹配网络，利用匹配网络反变换，确定特定特征阻抗的可匹配阻抗范围，并显示在Smith圆图中=========
w = 2*pi*6.78e6 ;
L = 4.7e-6 ;
C1 = linspace(26.65e-12,508.6e-12,1000) ;
C2 = linspace(0.472e-9,28e-9,1000) ;
[C1 , C2] = meshgrid(C1 , C2) ;
%% ====== 从负载端看过去=========
Zin= 50 ; % 电源内阻
Z2_1 = 1./(1./(Zin)+1i.*w.*C2) ;
Z2_2 = Z2_1 + 1./(1i.*w.*C1)+1i*w*L  ;
S11_2 = (Z2_2 - 50)./(Z2_2 + 50) ;

h = figure(2);
set(h,'Color','white') ;
h = subplot(1,2,1) ;
set(h,'Color','white') ;

% inspect(h)

hold on

pcolor1 = pcolor(real(S11_2),-imag(S11_2),abs(S11_2)) ; % pcolor不能在函数中直接更改属性，只能获取句柄后，用set更改
set(pcolor1,'LineStyle','none','Facecolor','interp') ;
colormap jet ;% 更改colormap颜色
title('Smith Chart','FontSize',20,'FontWeight','normal','FontName','Times New Roman') ;
axis equal;
axis off
%% =======Smithchart============
t = linspace(0, 2*pi, 200);
x = cos(t);
y = sin(t);
plot(x, y,'k','linewidth', 2);
% Draw circles along horizontal axis
k = [.25 .5 .75]; % 等电阻圆 平移K长度，半径为(1-K)
for i = 1 : length(k) % length(K)=3
    x(i,:) = k(i) + (1 - k(i)) * cos(t);
    y(i,:) = (1 - k(i)) * sin(t);
    plot(x(i,:), y(i,:), 'k') % k 表示黑色
end 
% Draw partial circles along vertical axis
k = [.5 1 2 6]; % 等电抗圆的半径、纵轴偏移量
kt = [2.5 pi 3.785 4.383]; % 等电抗圆和等电阻圆交点的弧度，实轴正方向弧度为0 , 大短小长
%kt = 1.69*k.^(0.285)+1.448 ;
for i = 1 : length(kt)
    t = linspace(kt(i), 1.5*pi, 200);
    a(i,:) = 1 + k(i) * cos(t);
    b(i,:) = k(i) + k(i) * sin(t);
    plot(a(i,:), b(i,:),'k',a(i,:), -b(i,:),'k' ) % k : 表示 黑色 虚线
end
%% ====== 直角坐标=========
Zin= 50 ; % 电源内阻
Z2_1 = 1./(1./(Zin)+1i.*w.*C2) ;
Z2_2 = Z2_1 + 1./(1i.*w.*C1)+1i*w*L  ;

subplot(1,2,2)
axis equal;
% 先画图再设置坐标
pcolor1 = pcolor(real(Z2_2),-imag(Z2_2),abs(S11_2)) ; % pcolor不能在函数中直接更改属性，只能获取句柄后，用set更改
set(pcolor1,'LineStyle','none','Facecolor','interp') ;
colormap jet ;% 更改colormap颜色
title('Cartesian Coordinate','FontSize',30,'FontWeight','normal','FontName','Times New Roman') ;
set(gca,'FontSize',15)
 grid on
 
xlabel('Re[Z_{in}]')
ylabel('Im[Z_{in}]')
axis([-5 30 -200 800])

