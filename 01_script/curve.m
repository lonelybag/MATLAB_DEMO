function curve

t = linspace(0 , 2*pi , 1000) ;
y = sin(t) ;

subplot(2,1,1)
plot(t , y)
hold on
num = 1:100:length(t) ;
t2 = t(num)
y2 = y(num) ;
plot(t2 , y2, 'o')

subplot(2,1,2)
plot(t , y)
hold on
t3 = linspace(0 , 2*pi , 10) ;
y3 = sin(t3) ;
plot(t3,y3,'o')
