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

wi = 0.55 * wc;

Fy_improper = minreal((s + wi) * Gd / (s * G));

L_improper = Fy_improper * G;

% The closed-loop transfer function from d to y

Cd_improper = minreal(Gd / (1 + L_improper));

%% Second attempt

wi = 0.5 * wc;
p_1 = 5 * wc;
p_2 = 5 * wc;

Fy_proper = minreal((s + wi) * p_1*p_2 / ((s+p_1)*(s+p_2)) * Gd / (s * G) );

L_proper = Fy_proper * G;

% The closed-loop transfer function from d to y

Cd_proper = minreal(Gd / (1 + L_proper));


%% Plot figures

bode(L_improper)
hold on
bode(L_proper)
legend('show')

figure
bode(Cd_improper)
hold on
bode(Cd_proper)
legend('show')

figure
step(Cd_improper)
hold on
step(Cd_proper)
legend('show')