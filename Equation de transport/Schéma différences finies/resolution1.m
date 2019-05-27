function [M] = resolution1(Tn,Xi,a,gtini,gxini)

len_Tn=length(Tn);
len_Xi=length(Xi);

M=zeros(len_Tn,len_Xi);
M(:,1)=gtini;
M(1,:)=gxini;
for n=2:len_Tn
    for i=2:len_Xi-1
        dt = Tn(n) - Tn(n-1);
        dx = Xi(i) - Xi(i-1);
        
        M(n,i) = M(n-1,i) - a*(dt/dx)*( M(n-1,i+1)-M(n-1,i) );
    end
    M(n,len_Xi)=M(n,1); %conditions aux limites
end