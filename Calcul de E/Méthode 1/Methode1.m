function Ex=Methode1(h,a,L,x,N) %Methode 1 pour évalue E pour chaque element du vecteur x.

A=@(x)simpson(h,a,x,N);

E0=-(simpson(A,a,L,N))/L;

for i = 1:1:length(x)
Ex(i)=simpson(h,a,x(i),N)+E0;
end

end