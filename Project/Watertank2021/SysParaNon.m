disp('****NON-MINIMUM PHASE SYSTEM****')

%% --- Non-minphase --- %
% Operating actuator proportional constants
k1 = 4.32;     % i cm^3/(Vs)
k2 = 3.74;     % i cm^3/(Vs)
% Outlet areas
a1 = 0.1678;   % i cm^2
a2 = 0.1542;   % i cm^2
a3 = 0.1591;  % i cm^2
a4 = 0.1685;  % i cm^2
% Valve settings
gam1 = 1-0.625;
gam2 = 1-0.625;
noise_level = 0;

h10 = 10.9991;     % i cm (nedre vänstra tanken)
h20 = 16.2974;     % i cm (nedre högra tanken)
h30 = 4.3468;     % i cm (övre vänstra tanken)
h40 = 6.3164;     % i cm (övre högra tanken)

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