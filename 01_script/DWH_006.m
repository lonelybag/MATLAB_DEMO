function DWH_006
filename = 'xiezhh.gif';
z = linspace(0, 10*pi, 100); %����һ��������
x = [20*sin(z),zeros(1,10)];
y = [20*cos(z),20*ones(1,10)];
z = [z,linspace(10*pi,0,10)];
plot3(x, y, z, 'r', 'linewidth', 2); %����������
hold on %ͼ�α���
h = plot3(0,20,0, '.' , 'MarkerSize' ,40, 'EraseMode' , 'xor' );
xlabel('X'); ylabel('Y'); zlabel('Z'); %����������ǩ
axis([-25 25 -25 25 0 40]); %���������᷶Χ
view(-210,30); %�����ӽ�
for i = 1:length(x)
    set(h, 'xdata' ,x(i), 'ydata' ,y(i), 'zdata' ,z(i));
    drawnow; % ˢ����Ļ
    pause(0.05)
    f = getframe(gcf);
    imind = frame2im(f);
    [imind,cm] = rgb2ind(imind,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
end