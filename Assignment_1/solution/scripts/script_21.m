clear
close all

s = tf('s');

%% Process
G = 20 / ((s+1)*((s/20)^2 + s/20 + 1));

%% Disturbance
Gd = 10 / (s+1);

% The disturbance's crossover frequency
[~,~,~,wc] = margin(Gd)


%% First attempt

Fy_improper = wc / (s * G);

L_improper = Fy_improper * G;

% The closed-loop transfer function from d to y

Cd_improper = Gd / (1 + L_improper);


%% Second attempt

w1 = 50 * wc;
w2 = 50 * wc;

Fy_proper = wc * w1 * w2 / (s * G * (s + w1) * (s + w2));

L_proper = Fy_proper * G;

% The closed-loop transfer function from d to y

Cd_proper = Gd / (1 + L_proper);

%% Plot figures
figure
bode(Cd_improper);
hold on
bode(Cd_proper);

figure
bode(L_improper);
hold on
bode(L_proper); 

figure
step(Cd_improper);
hold on
step(Cd_proper);