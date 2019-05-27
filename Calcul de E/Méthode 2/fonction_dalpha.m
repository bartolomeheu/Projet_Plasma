function[res]=fonction_dalpha(alpha,f,x)
Y0=[0;alpha];
[TOUT,YOUT]=ode45(f,x,Y0);
Ymoy=YOUT(:,1);
res=Ymoy(length(Ymoy));
end