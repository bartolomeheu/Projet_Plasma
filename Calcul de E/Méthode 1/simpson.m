function simpson=simpson(f,a,b,N)

         h=(b-a)/(N-1);
         
         temp=a;
         
         simpson=0;
         
         simpson1=0;
         
         simpson2=0;
         
         for i=1:N-1
             
             simpson1=simpson1+f((a+a+h)/2);
             
             a=a+h;

         end
         
         a=temp;
         
         simpson1=4*simpson1;
         
         for i=2:N-1
             
             simpson2=simpson2+f(a);
             
             a=a+h;
             
         end
         
         simpson2=simpson2*2;
         
         simpson=simpson+(h/6)*(f(a)+f(b)+simpson1+simpson2);   

end