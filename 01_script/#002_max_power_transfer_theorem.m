function max_power_transfer_theorem
Rs = 50 ;
RL = linspace(0,200,1000) ;
Us = 220 ;
Is = Us./(Rs + RL) ;
PL = Is.^2.*RL ;
PL = PL./242 ;
RL = RL./50 ;

figure(1)
set(figure(1),'color',[1,1,1])
plot(RL , PL,'Linewidth',2,'Color','Black','Linestyle','-.')
grid on
set(gca,'Linewidth',2,'FontSize',20)

xlabel('Z_{in}/Z_s^{*}','FontSize',20,'FontName','Times New Roman')
ylabel('P_{L}/P_{max}','FontSize',20,'FontName','Times New Roman')
h = legend('$\frac{P_L}{P_{max}}$') ;
set(h,'interpreter','latex')
%% 调整图片大小
set(gcf, 'position', [200 200 700 400]);

