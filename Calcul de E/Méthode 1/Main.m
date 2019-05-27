n=0.01;
x=-2*pi:n:2*pi;
N=1000;%Pour calcule des intégrale
L=2*pi;
a=0;
h=@(x)cos(x);
%h=@(x)cos(x).*exp(-x.^2/2);
%h=@(x)x*x;
Ex=Methode1(h,a,L,x,N);
Exacte=sin(x);
ErreurMeth1=abs(Ex-sin(x));

Ex2=methode_par_integrale(h(x),a,L,635);

plot(x,Ex,x,sin(x),x,ErreurMeth1);
legend('E approx','E exacte','Erreur de la methode');
% figure
% plot(x,ErreurMeth1);
% legend('Erreur Methode 1');
figure
plot(x,Ex2,x,sin(x))