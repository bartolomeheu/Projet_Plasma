%Valeurs qu'on peut modifier
h=@(x) cos(x);
L=2*pi;
mda=0;
deltax=0.001;
val_min_alpha=-50;
val_max_alpha=50;
erreur_alpha=10^(-6);

%Programme
vect=mda:deltax:L;
A=[0 1;0 0];
B=@(x) [0;h(x)];
f=@(x,y) A*y+B(x);

phi=@(alpha) fonction_dalpha(alpha,f,vect);

alp=dichotomy(phi,val_min_alpha,val_max_alpha,erreur_alpha);
Y0=[0;alp];
[TOUT,YOUT]=ode45(f,vect,Y0);
Yres=YOUT(:,1);

plot(TOUT,Yres)
