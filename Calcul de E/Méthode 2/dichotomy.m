function [res]=dichotomy(f,a,b,eps)
val_max=10^2;
cmp=1;
res=(b-a)/2;
while abs(f(res))>eps && cmp<val_max
    res=(a+b)/2;
    if (f(a)*f(res)<=0)
        b=res;
    else
        a=res;
    end
    cmp=cmp+1;
end
if cmp>=val_max
    -1
end
end