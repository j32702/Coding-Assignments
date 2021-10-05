function v = rootsproblem1(xl, xu, n, eat, max) %incremental search and bisect
Q2 = @(x) x.^4 - x.*sin(10*x) - 2*cos(5*x).*cos(5*x)/5 - cos(5*x)/25 + 11/25;
T = @(x) 100*x + 200*Q2(1)*x - 200*Q2(x) - 80;

i = 1; t = 0;
x_mid_new = 0;
p = linspace(xl,xu,n);
ea = 100;

v0 = ['Initial Interval: [', num2str(xl), ', ', num2str(xu), ']'];
disp(v0)

while(1)
    xl_new = p(i);
    xu_new = p(i+1);
    y1 = T(xl_new);
    y2 = T(xu_new);
    if(y1*y2 < 0)
        break
    else
        i = i + 1;
    end
end

v1 = ['Interval After Incremental Search: [', num2str(xl_new), ', ', num2str(xu_new), ']'];
disp(v1)

while(1)
    x_mid_old = x_mid_new;
    x_mid_new = (xl_new + xu_new) / 2;
    y1 = T(xl_new);
    y_mid = T(x_mid_new);
    
    if(y1*y_mid < 0)
        xu_new = x_mid_new;
    else
        xl_new = x_mid_new;
    end
    
    if(t > 1)
        ea = abs(x_mid_new - x_mid_old) * 100 / abs(x_mid_new);
    end
    
    if (ea <= eat) || (t >= max)
        break
    end
    t = t + 1;
end

v2 = ['Interval After Bisection Method: [', num2str(xl_new), ', ', num2str(xu_new), ']'];
disp(v2)