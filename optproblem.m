function v = optproblem(xl, xu, x0, eat, max)
Q1 = @(x) 4*x.^3 + sin(5*x)/5 + sin(10*x) + 10*x*(2*((sin(5*x)).^2)-1);
Q2 = @(x) x.^4 - x.*sin(10*x) - 2*cos(5*x).*cos(5*x)/5 - cos(5*x)/25 + 11/25;
T = @(x) 100*x + 200*Q2(1)*x - 200*Q2(x);
dT = @(x) 100+200*Q2(1) - 200*Q1(x);

i = 1; t = 1;
ea = 100;
x_mid_new = 0;
% x1 = xl;
% x2 = xu;

while(1)
    x_mid_old = x_mid_new;
    x_mid_new = (xl + xu) / 2;
    y1 = dT(xl);
    y_mid = dT(x_mid_new);
    
    if(y1*y_mid < 0)
        xu = x_mid_new;
    else
        xl = x_mid_new;
    end
    
    if(t > 1)
        ea = abs(x_mid_new - x_mid_old) * 100 / abs(x_mid_new);
    end
    
    if ea <= eat || t >= max
        break
    end
    t = t + 1;
end

v0 = ['Bisect Maximum x: ', num2str(xl)];
disp(v0)
v1 = ['Bisect Maximum Temperature; ', num2str(T(xu))];
disp(v1)

roots = [];
froots = [];
x0 = 0.7;
iter  = 0; xr_new = x0; ea_new = 100;

while(1)
    iter = iter + 1;
    xr_old = xr_new;
    ea_old = ea_new;
    h = 0.0001;
    dT_xr_old = (dT(xr_old + h) - dT(xr_old)) / h;
    xr_new = xr_old - dT(xr_old) / dT_xr_old;
    if iter > 1
        if abs(xr_new) > 0.000001
            ea_new = abs((xr_new - xr_old) / xr_new) * 100;
        else
            ea_new = 0;
        end
    end
    
    roots(iter) = xr_new;
    froots(iter) = dT(xr_new);
    ea(iter) = ea_new;
    
    if ea_new <= eat || iter >= max
        break;
    end
end

v0 = ['Secant Maximum x: ', num2str(roots(end))];
disp(v0)
v1 = ['Secant Maximum Temperature: ', num2str(T(roots(end)))];
disp(v1)