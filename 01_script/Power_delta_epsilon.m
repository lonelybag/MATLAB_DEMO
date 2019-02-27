function Power_delta_epsilon

f = linspace(5.5e6,9e6,500) ;
w = 2.*pi.*f ;
w0 = 2*pi*6.78e6 ;

Us = 50*sqrt(2) ;
R1 = 50 ;
R4 = 50 ;
R = 0.5 ;
Rr = R1./R ;

Q = 1448.4 ;
delta = linspace(1 , 200 , 500) ;
epsilon = Q.*(w./w0 - w0./w) ;

[delta , epsilon] = meshgrid(delta , epsilon) ;

PL = (Us.^2).*R4./(R.^2).*...
        ((2.*delta.*(Rr+1).*epsilon).^2+((delta.^2).*(delta.^2-epsilon.^2+(Rr+1).^2).^2))./...
        ((((Rr+1).^2+delta.^2-epsilon.^2).^2+4.*((Rr+1).^2).*epsilon.^2).^2) ;

%% ��ͼ
fig1 = figure(1) ;
fig1.Color = 'W' ;
colormap jet ;% ����colormap��ɫ

meshc(delta , epsilon , PL)

xlabel('�������\delta','Rotation',-12)
ylabel('ʧг����\zeta','Rotation',20)
zlabel('���ؽ��չ��� / W')
set(gca,'FontSize',20)