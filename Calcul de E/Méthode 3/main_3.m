%Méthode 03 : Point fixe, système linéaire et compagnie <3 
L=6*pi;
x=0:0.001:L;
phi_2nd = @(x) cos(x);
phi_app=systeme1_diff_div(phi_2nd,x,L);
phi1er=systeme2_diff_div(phi_app,x);
plot(x,phi1er,x,sin(x));

erreur=phi1er-phi_2nd;
plot(x,erreur)