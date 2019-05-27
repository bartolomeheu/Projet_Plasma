function phi_1er=systeme2_diff_div(phi_approchee,x)
n=length(x);
dx=abs(x(3)-x(2));
phi_1er=zeros(n,1);
for i=1:n
    phi_1er(i)=(phi_approchee(i+1)-phi_approchee(i))/dx;
end
end
