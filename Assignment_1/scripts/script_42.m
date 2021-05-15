close all;
clear all;
clc;

s = tf('s');
G = 20 / ((s + 1) * ((s/20)^2 + (s/20) + 1)); % system
Gd = 10 / (s + 1); % disturbance dynamics

%% Exercise 4.2.1
[~, ~, ~, wc] = margin(Gd);

% Improper contoller
Fy = (wc / s) * (1 / G); % controller
L = G * Fy;             % open-loop transfer function
Gdy = Gd / (1 + L);     % transfer function from d --> y

% figure, hold on
% bode(Gdy)

% Proper controller
p1 = 100*wc;
p2 = 100*wc;
Fy = Fy * (p1 * p2) / ((s+p1) * (s+p2));
L = G * Fy;
Gdy = Gd / (1 + L);

% bode(Gdy)

%% Exercise 4.2.2

% Improper controller with added lag controller
wI = 0.5*wc;
Fy = (s+wI)/s * (1/G) * Gd;
L = G * Fy;
Gdy = Gd / (1 + L);

% step(Gdy)

% Proper controller with added lag controller
p1 = 5*wc;
p2 = 5*wc;
Fy = Fy * p1*p2/((s+p1)*(s+p2));
L = G * Fy;
Gdy = Gd / (1 + L);

% figure, hold on
% step(Gdy)
% grid on

%% Exercise 4.2.3

% Add lead controller
wcd = 2*wc;
pmd = 30;
pm = 180+180/pi*angle(evalfr(G,1i*wcd));
beta = (1 - sind(pmd-pm)) / (1 + sind(pmd-pm));
t_D = 1 / (wcd * sqrt(beta));
Fy = Fy * (t_D*s + 1) / (beta*t_D*s + 1);
K = 1 / abs(evalfr(G * Fy,1i*wcd));
Fy = K * Fy;

tau = .1;
Fr = 1 / (1 + tau*s); % prefilter

S = 1 / (1 + G * Fy); % sensitivity function
Gc = (G * Fy * Fr) * S; % closed-loop function
Gru = Fy * Fr * S; % r --> u transfer function
Gdu = Fy * Gd * S; % d --> u transfer function

% figure, hold on
% step(Gc)
% step(Gru)
% step(Gdu)
% step(0.5*Gru+0.5*Gdu)
% legend('r -> u', 'd -> u', '0.5r+0.5d -> u')
% grid on


%% Exercise 4.2.4
T = 1 - S; % complementary sensitivity function
figure, hold on
bode(S)
bode(T)
grid on


















