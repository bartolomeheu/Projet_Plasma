function [M,E] = splitting2(f0, t, x, v)
  
      T = length(t);
      K = length(x);
      J = length(v);
      
      N=100;
      
      M = zeros(K, J, T);
      [xx, vv] = meshgrid(x, v);
      M(:,:,1) = (f0(xx, vv))';
      % figure(1)
      % surf(x, v, (M(:,:,1))')
      E=zeros(K,T);
      for n=2:1:T-1 % on avance par pas de 2
            % n=2; % pour les tests
            dt = t(n) - t(n-1);
            
            %%% 1ère étape : semilag selon t et x pour tous les v
            for j=1:J
                 % On prend a = v(j)
                 % j = 1;  % pour les tests
                  Mtemp = schema_semi_lagrangien([0,dt], x, M(:,j,n-1), v(j)); 
                  % on veut récup la 2e colonne (temps final de cette itération)
                  M(:,j,n) = Mtemp(:,2);
                  
                  %figure(2)
                  %plot(x, M(:,j,n-1), x, M(:,j,n))
                  %legend('n=1', 'n=2')
            end
            
            %%% 2e étape : calcul de h, puis du champ E
            for i=1:length(x)
                h(i)=1-trapezeVect(M(i,1:J,n),v(1),v(J),N);% somme du 2e vecteur de la matrice donc V
            end

       
            E1=systeme1_diff_div(h,x);
            E(:,n)=systeme2_diff_div(E1,x);% E vect de même taille que X
 
            %%% 3e étape : semilag selon v et t, pour tous les x, avec a = E(x)
            % /!\ le n a augmenté !!
            
            dt = t(n+1) - t(n);
            
            for i=1:K
                  % a = E(xi) ici qui s'appelle E(i)
                 Mtemp = schema_semi_lagrangien([0,dt], v, M(i,:,n), E(i));
                 M(i,:,n+1) = Mtemp(:,2);
            end
            % figure(n)
            % surf(x, v, (M(:,:,n))')
            % figure(n+1)
            %surf(v, x, M(:,:,n))    
     end          
                 
    

end