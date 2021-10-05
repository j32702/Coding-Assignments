%% problem 1i

syms x

qext = @(x) 12*x^2 + cos(5*x) + 100*x*sin(10*x);

Q1 = int(qext, 0, x);

Q2 = int(Q1, 0, x);

qext

Q1

Q2

eval(Q2(1))

%% problem 1ii
L=1;
x = 0:0.01:1;

qext = @(x) 12*x.^2 + cos(5*x) + 100*x.*sin(10*x);
Q2 = @(x) x.^4 - x.*sin(10*x) - 2*cos(5*x).*cos(5*x)/5 - cos(5*x)/25 + 11/25;
T = @(x) 100.*x + 200.*x.*Q2(L) - 200.*Q2(x);

y1 = 0.*x + 80;
y2 = 0.*x + 40;

figure; hold on;
title('Problem 1');
grid on;
plot(x, T(x), 'b--o', x, qext(x), 'r--+', x, y1, 'g', x, y2, 'k');
legend('T(x)-Temp.', 'qext(x)-Heat', 'y = 80', 'y = 40');
