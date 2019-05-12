function DWH_007

filename = '水波纹动态显示.gif';
x=-8:0.5:8;
[XX,YY]=meshgrid(x);
r=sqrt(XX.^2+YY.^2)+eps;
Z=sin(r)./r;
surf(Z);
theAxes=axis;
fmat=moviein(20);
for j=1:20
surf(sin(2*pi*j/20)*Z,Z)
axis(theAxes)
fmat(:,j)=getframe;
%下面语句是将静态图像的每一帧进行叠加存储，并写入到filename文件夹中
f = getframe(gcf);
imind = frame2im(f);
[imind,cm] = rgb2ind(imind,256);
if j == 1
imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1);
else
imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.1);
end
end
movie(fmat,10)