function M=SchemaSemiLagrangien2(Tn, Xi, g0, a)

N = length(Tn);
K = length(Xi);

M = zeros(K,N);
M(:,1) = g0(Xi);

for n=2:N
    for i=1:K
        
        dt=Tn(n)-Tn(n-1);
        xk=mod((Xi(i)-a*dt),Xi(K));
        j=1;
        
        while Xi(j)<xk
            j=j+1;
        end
        
        if j==1
            
            y=[M(j,n-1),M(j+1,n-1),M(j+2,n-1)];
            xsi=[Xi(j),Xi(j+1),Xi(j+2)]; 
        
        elseif j==K
            
            y=[M(j-2,n-1),M(j-1,n-1),M(j,n-1)];
            xsi=[Xi(j-2),Xi(j-1),Xi(j)];
            
        else
            
            y=[M(j-1,n-1),M(j,n-1),M(j+1,n-1)];
            xsi=[Xi(j-1),Xi(j),Xi(j+1)];
        
        end    
            
        P=polyfit(xsi,y,2);        
        M(i,n)=polyval(P,xk);
    end
end

end