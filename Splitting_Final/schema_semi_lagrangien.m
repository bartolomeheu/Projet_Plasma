function M = schema_semi_lagrangien(t, x, vect_f0, a)

  N = length(t);
  K = length(x);

  M = zeros(K, N);
  M(:,1) = vect_f0;  % 1ère ligne : fonction au temps initial
  

  for n=2:N
      for i=1:K
          
          dt = t(n) - t(n-1);
          xk = mod( (x(i)-a*dt), x(K));
          
          j = 1;
          while x(j)<xk
              j = j+1;
          end  % j est l'indice du x juste supérieur à xk
          
          if j==1  % je pense que c'est inutile… (voir com. juste au dessus)
              
              y = [ M(j,n-1), M(j+1,n-1), M(j+2,n-1) ];
              xsi = [ x(j), x(j+1), x(j+2) ]; 
          
          elseif j==K
              
              y = [ M(j-2,n-1), M(j-1,n-1), M(j,n-1) ];
              xsi = [ x(j-2), x(j-1), x(j) ];
              
          else
              
              y = [ M(j-1,n-1), M(j,n-1), M(j+1,n-1) ];
              xsi = [ x(j-1), x(j), x(j+1) ];
          
          end    
              
          P = polyfit(xsi, y, 2);        
          M(i,n) = polyval(P, xk);
      end
  end

end