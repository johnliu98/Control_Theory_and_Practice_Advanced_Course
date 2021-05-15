%% --- Minphase --- %
% Operating actuator proportional constants
k1 = 4.32;     % i cm^3/(Vs)
k2 = 3.74;     % i cm^3/(Vs)
% Outlet areas
a1 = 0.1510;   % i cm^2
a2 = 0.1298;   % i cm^2
a3 = 0.0615;  % i cm^2
a4 = 0.0565;  % i cm^2
% Valve settings
gam1 = 0.625;
gam2 = 0.625;
noise_level = 0;
% Linearization point
% h10 = 18; = 72%     % i cm (nedre v�nstra tanken)
% h20 = 18; = 72%     % i cm (nedre h�gra tanken)
% h30 = 14; = 56%     % i cm (�vre v�nstra tanken)
% h40 = 19; = 76%     % i cm (�vre h�gra tanken)

%% --- Nonminphase --- %
% % Operating actuator proportional constants
% k1 = 4.32;     % i cm^3/(Vs)
% k2 = 3.74;     % i cm^3/(Vs)
% % Outlet areas
% a1 = 0.1678;   % i cm^2
% a2 = 0.1542;   % i cm^2
% a3 = 0.1591;  % i cm^2
% a4 = 0.1685;  % i cm^2
% % Valve settings
% gam1 = 1-0.625;
% gam2 = 1-0.625;
% noise_level = 0;
% 
% % h10 = x;     % i cm (nedre v�nstra tanken)
% % h20 = x;     % i cm (nedre h�gra tanken)
% % h30 = x;     % i cm (�vre v�nstra tanken)
% % h40 = x;     % i cm (�vre h�gra tanken)

%% --- Common parameters --- %
% Cross section areas
A1 = 15.5179;   % cm^2
A2 = 15.5179;   % cm^2
A3 = 15.5179;   % cm^2
A4 = 15.5179;   % cm^2
% Sensor proportional constant
kc = 0.2;       % V/cm
delta1=0.125;
delta2=0.125;