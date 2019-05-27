function E = methode_par_integrale(vect_f,a,b,N) 
    % pour évaluer int{fct} en chaque élément du vecteur x.

    % là pour le coup c'est à vérifier, c'est l'étape qui marche le moins en plottant
    L = length(vect_f);
    
    h=(b-a)/(N-1);
    
    Itemp = zeros(1, L);
    for i=1:L
        Itemp(i) = sum(vect_f(1:i))*h+(h/2)*(vect_f(i)-vect_f(1));
    end
    
    E0 = sum(Itemp)/vect_f(L);
    E = Itemp + E0;
    
end