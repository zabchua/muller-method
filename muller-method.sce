function f=f(x) 
    //f=x^3-x^2-x-1
    //f=x^3-13*x-12
    //f = x^3 + x^2 - 4*x - 4
    //f = x^3 - 0.5*x^2 + 4*x - 2
endfunction

xr = 2;
h = 0.1;
x2 = xr;
x1 = xr + h * xr;
x0 = xr - h * xr;

eps = 0.0000000001;
maxit = 10;
dxr=1;
iter=0;
check=1;

mprintf("\n i \t x \t\t f(x)")

while (abs(dxr)>eps)&(iter<maxit)
    iter = iter + 1;
    h0 = x1 - x0;
    h1 = x2 - x1;
    d0 = (f(x1) - f(x0))/h0;
    d1 = (f(x2) - f(x1))/h1;
    a = (d1 - d0)/(h1 - h0);
    b = a * h1 + d1;
    c = f(x2);
    rad = sqrt(b^2 - 4*a*c);
    if abs(b + rad) > abs(b - rad) then
        den = b + rad;
    else
        den = b - rad;
    end
    dxr = (-2 * c)/den;
    xr = x2 + dxr;
    x0 = x1;
    x1 = x2;
    x2 = xr;
    
    mprintf("\n %d \t %.10f \t %.10f", iter, xr, f(xr))
end
