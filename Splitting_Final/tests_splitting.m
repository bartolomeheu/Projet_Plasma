%%% tests splitting %%%

x = 0:0.1:4*pi;
v = -5:0.1:5;
T = 10;
t = 0:0.1:T;

epsilon = 0.2;
k = 1;
f0 = @(x,v) (1/sqrt(2*pi)).*(v.^2).*(exp(-v.^2/2).*(1+epsilon*cos(k*x)));
%f0 = @(x,v) (1/sqrt(2*pi)).*(exp(-v.^2/2).*(1+epsilon*cos(k*x)));

[M,E] = splitting2(f0, t, x, v);

surf(E)