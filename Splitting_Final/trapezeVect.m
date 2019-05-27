function trapeze=trapezeVect(f,a,b,N)

  h=(b-a)/(N-1);
  
  trapeze=0;
  
  for i=2:N-1
      
      trapeze=trapeze+f(i);
      
  end
  
  trapeze=trapeze*h+(h/2)*(f(1)+f(N));

end