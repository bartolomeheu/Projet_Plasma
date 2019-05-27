function [] = test(k)
Xi = 0:0.05:2*pi;
Tn = 0:0.05:2*pi;
a = 1.0001;
g0 = @(x)cos(x);


gtini=g0(-a*Tn);
gxini=g0(Xi);

M1=resolution1(Tn,Xi,a,gtini,gxini);
M2=resolution2(Tn,Xi,a,gtini,gxini);
M3=resolution3(Tn,Xi,a,gtini,gxini);
M4=decentre_droit__t_decentre_gauche_x(Tn,Xi,a,gtini,gxini);
M5=decentre_gauche_t_decentre_droit_x(Tn,Xi,a,gtini,gxini);
M6=semi_lagrangien(Tn,Xi,a,gxini);
M=solution_exacte(Tn,Xi,g0,a);

if k~=0
    Xi=Xi(1:k);
    Tn=Tn(1:k);
    M=M(1:k,1:k);
    M1=M1(1:k,1:k);
    M2=M2(1:k,1:k);
    M3=M3(1:k,1:k);
    M4=M4(1:k,1:k);
    M5=M5(1:k,1:k);
    M6=M6(1:k,1:k);
end

figure(1)
subplot(2,2,1), surf(Tn,Xi,M)
subplot(2,2,2), surf(Tn,Xi,M1)
subplot(2,2,3), plot(Tn,M(length(Tn),:))
subplot(2,2,4), plot(Tn,M1(length(Tn),:))

figure(2)
subplot(2,2,1), surf(Tn,Xi,M)
subplot(2,2,2), surf(Tn,Xi,M2)
subplot(2,2,3), plot(Tn,M(length(Tn),:))
subplot(2,2,4), plot(Tn,M2(length(Tn),:))

figure(3)
subplot(2,2,1), surf(Tn,Xi,M)
subplot(2,2,2), surf(Tn,Xi,M3)
subplot(2,2,3), plot(Tn,M(length(Tn),:))
subplot(2,2,4), plot(Tn,M3(length(Tn),:))

figure(4)
subplot(2,2,1), surf(Tn,Xi,M)
subplot(2,2,2), surf(Tn,Xi,M4)
subplot(2,2,3), plot(Tn,M(length(Tn),:))
subplot(2,2,4), plot(Tn,M4(length(Tn),:))

figure(5)
subplot(2,2,1), surf(Tn,Xi,M)
subplot(2,2,2), surf(Tn,Xi,M5)
subplot(2,2,3), plot(Tn,M(length(Tn),:))
subplot(2,2,4), plot(Tn,M5(length(Tn),:))

figure(6)
subplot(2,2,1), surf(Tn,Xi,M)
subplot(2,2,2), surf(Tn,Xi,M6)
subplot(2,2,3), plot(Tn,M(length(Tn),:))
subplot(2,2,4), plot(Tn,M6(length(Tn),:))
end 