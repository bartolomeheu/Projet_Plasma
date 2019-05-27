function [X]=systeme1_diff_div(phi_2nd,x,L)

n=length(phi_2nd(x));
dx=abs(x(3)-x(2));
%matrice A : 
A=-2*diag(ones(1,n-1));
A=A+diag(ones(1,n-2),1);
A=A+diag(ones(1,n-2),-1);
A=(1/dx^2)*A;
%vecteur B :
B2=phi_2nd(x);
B=B2(1:length(B2)-1)';
X2=A\B;
X=[0 ;X2 ;0];

end

