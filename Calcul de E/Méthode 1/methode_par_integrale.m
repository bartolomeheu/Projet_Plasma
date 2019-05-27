function E = methode_par_integrale(vect_f,a,b,N) 
    % pour evaluer int{fct} en chaque element du vecteur x.

    % la  pour le coup c'est a  verifier, c'est l'etape qui marche le moins en plottant
    L = length(vect_f);
    
    h=(b-a)/(N-1);
    
    Itemp = zeros(1, L);
    for i=1:L
          Itemp(i) = sum(vect_f(1:i))*h+(h/2)*(vect_f(1)+vect_f(i));
    end
    
    A=@(x)trapezeVect(vect_f,a,x,N);
    
    E0 = -(simpson(A,a,b,N))/b;
    
    %E0 = sum(Itemp)/vect_f(L);
    E = Itemp + E0;
 
end