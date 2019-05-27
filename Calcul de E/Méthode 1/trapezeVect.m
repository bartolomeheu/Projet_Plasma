function trapezeVect=trapezeVect(f,a,b,N)

  h=(b-a)/(N-1);
  
  trapezeVect=sum(f);
  
  trapezeVect=trapezeVect*h+(h/2)*(f(1)+f(length(f)));
  
end