%Problem 1 code
function v = assignment1(deltat, tF, m0, v0, mbar, ve, cd, g)

% deltat = 0.125;
% tF = 10;
% m0 = 1000;
% v0 = 0;
% mbar = 100;
% ve = -2000;
% cd = 0.1;
% g = 9.81;
tbar = 0.4*tF;

time = 0:deltat:tF;

for t=1:length(time)
    if t == 1
        v(t) = v0;
        m(t) = m0;
        dvdt(t) = mbar/m(t)*(v(t)-ve) - g - (cd/m(t)) * abs(v(t))*v(t);
    else if t <= (tbar/deltat)
            m(t) = m0 - mbar*deltat*(t-1);
            v(t) = v(t-1) + deltat*(dvdt(t-1));
            dvdt(t) = mbar / m(t) * (v(t)-ve) - g - (cd / m(t)) * abs(v(t)) * v(t);
        else
            m(t) = m0 - tbar*100;
            v(t)=v(t-1) + deltat*(dvdt(t-1));
            dvdt(t)= 0 / m(t) * (v(t)-ve) - g - (cd / m(t)) * abs(v(t)) * v(t);
        end
    end
end
m(length(time))
v(length(time))

tiledlayout(2,1)

ax1=nexttile;
plot (time, v, 'r--o');
title(ax1,'Velocity')
ylabel(ax1, 'm/s')
xlabel(ax1, 'time (s)')

ax2=nexttile;
plot (time, m, 'g--o');
title(ax2,'Mass')
ylabel(ax2, 'kg')
xlabel(ax2, 'time (s)')

%Problem 3 code

% function v = assignment1()
% 
% deltat = 0.125;
% tF = 10;
% m0 = 1000;
% v0 = 0;
% mbar = 100;
% ve = -2000;
% cd = 0.1;
% g = 9.81;
% tbar = 0.4*tF;
% 
% time = 0:deltat:tF;
% 
% for t=1:length(time)
%     if t == 1
%         v(t) = v0;
%         m(t) = m0;
%         dvdt(t) = mbar/m(t)*(v(t)-ve) - g - (cd/m(t)) * abs(v(t))*v(t);
%     else if t <= (tbar/deltat)
%             m(t) = m0 - mbar/tbar * time(t) * time(t) ;
%             v(t) = v(t-1) + deltat*(dvdt(t-1));
%             dvdt(t) = mbar / m(t) * (v(t)-ve) - g - (cd / m(t)) * abs(v(t)) * v(t);
%         else
%             m(t) = m0 - tbar*100;
%             v(t)=v(t-1) + deltat*(dvdt(t-1));
%             dvdt(t)= 0 / m(t) * (v(t)-ve) - g - (cd / m(t)) * abs(v(t)) * v(t);
%         end
%     end
% end
% m(length(time))
% v(length(time))
% 
% tiledlayout(2,1)
% 
% ax1=nexttile;
% plot (time, v, 'r--o');
% title(ax1,'Velocity')
% ylabel(ax1, 'm/s')
% xlabel(ax1, 'time (s)')
% 
% ax2=nexttile;
% plot (time, m, 'g--o');
% title(ax2,'Mass')
% ylabel(ax2, 'kg')
% xlabel(ax2, 'time (s)')