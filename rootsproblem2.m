function v = rootsproblem2(x0, eat, max)
Q1 = @(x) 4*x.^3 + sin(5*x)/5 + sin(10*x) + 10*x*(2*((sin(5*x)).^2)-1);
Q2 = @(x) x.^4 - x.*sin(10*x) - 2*cos(5*x).*cos(5*x)/5 - cos(5*x)/25 + 11/25;
T = @(x) 100*x + 200*Q2(1)*x - 200*Q2(x) - 40;
dT = @(x) 100+200*Q2(1) - 200*Q1(x);

roots=[];
froots=[];
ea=[];
iter = 0; xr_new = x0; ea_new = 100;

while(1)
    iter = iter + 1;
    xr_old = xr_new;
    ea_old = ea_new;
    
    xr_new = xr_old - T(xr_old) / dT(xr_old);
    if iter > 1
        ea_new = abs((xr_new - xr_old) / xr_new) * 100;
    end
    
    roots(iter) = xr_new;
    froots(iter) = T(xr_new);
    ea(iter) = ea_new;
    
    if ea_new <= eat || iter >= max
        break;
    end
end
v1 = ['Newton Raphson Root: ', num2str(roots(end))];
disp(v1)


roots = [];
froots = [];
eat = 0.001;

iter  = 0; xr_new = x0; ea_new = 100;

while(1)
    iter = iter + 1;
    xr_old = xr_new;
    ea_old = ea_new;
    h = 0.0001;
    dT_xr_old = (T(xr_old + h) - T(xr_old)) / h;
    xr_new = xr_old - T(xr_old) / dT_xr_old;
    if iter > 1
        if abs(xr_new) > 0.000001
            ea_new = abs((xr_new - xr_old) / xr_new) * 100;
        else
            ea_new = 0;
        end
    end
    
    roots(iter) = xr_new;
    froots(iter) = T(xr_new);
    ea(iter) = ea_new;
    
    if ea_new <= eat || iter >= max
        break;
    end
end

v1 = ['Secant Root: ', num2str(roots(end))];
disp(v1)