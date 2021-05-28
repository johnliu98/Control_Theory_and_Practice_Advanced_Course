disp('****MINIMUM PHASE SYSTEM****')

%% --- Minphase --- %
% Operating actuator proportional constants
k1 = 4.32;     % i cm^3/(Vs)
k2 = 3.74;     % i cm^3/(Vs)
% Outlet areas
a1 = 0.1577;   % i cm^2
a2 = 0.1411;   % i cm^2
a3 = 0.0587;  % i cm^2
a4 = 0.0488;  % i cm^2
% Valve settings
gam1 = 0.625;
gam2 = 0.625;
noise_level = 0;
% Linearization point
h10 = 12.4208;     % i cm (nedre vänstra tanken)
h20 = 14.4268;     % i cm (nedre högra tanken)
h30 = 10.4728;     % i cm (övre vänstra tanken)
h40 = 20.2123;     % i cm (övre högra tanken)

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
% Gravitational constant
g = 981;        % cm/s^2

% System parameters
T1 = A1/a1*sqrt(2*h10/g);
T2 = A2/a2*sqrt(2*h20/g);
T3 = A3/a3*sqrt(2*h30/g);
T4 = A4/a4*sqrt(2*h40/g);

c1 = T1*kc/A1;
c2 = T2*kc/A2;
c3 = T3*kc/A3;
c4 = T4*kc/A4;