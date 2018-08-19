function PT_Symetric

K = linspace(-1 , 1 ,1000) ;
Gamma = 0.5 ;
w = 1 - sqrt(K .^ 2 - Gamma .^ 2) ;
hold on
box on
grid on
h1 = plot(K ,real(w)) ;
h2 = plot(K,imag(w)) ;

w = 1 + sqrt(K .^ 2 - Gamma .^ 2) ;
h3 = plot(K ,real(w)) ;
h4 = plot(K,imag(w)) ;

set(h1,'Color','b')
set(h2,'Color','r')
set(h3,'Color','b')
set(h4,'Color','r')

ax = gca ;
ax.XLim = [-1 1] ;
ax.YLim = [-1,2] ;
ax.XDir = 'revers' ;
