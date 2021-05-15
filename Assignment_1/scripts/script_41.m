close all;
clear all;
clc;

%% Exercise 4.1.1
pmd = 30; % desired phase margin
wcd = 0.4; % desired cross-over frequency

s = tf('s');
G = 3*(-s+1)/((5*s+1)*(10*s+1)); % open-loop transfer function

% Phase margin of G at the desired cross-over frequency.
pm = 180+180/pi*angle(evalfr(G,1i*wcd));

% Choose beta to increase phase margin to 35.7 deg.
beta = (1 - sind(pmd+5.7-pm)) / (1 + sind(pmd+5.7-pm));

% Choose t_D to place the lead phase at the desired cross-over frequency.
t_D = 1/(wcd*sqrt(beta));

% Construct the lead controller.
F_lead = (t_D*s+1)/(beta*t_D*s+1);

% Choose gamma to remove static error.
gamma = 0;

% Choose t_I to reduce the phase margin by 5.7 resulting in a total
% phase margin of 30 deg.
t_I = 1/(wcd*tand(5.7));

% Construct lag controller.
F_lag = (t_I*s+1)/(t_I*s+gamma);

% Choose K such that |K*F_lead*F_lag*G| = 1
% at the desired cross-over frequency wcd=0.4.
K = 1/abs(evalfr(F_lead*F_lag*G,1i*wcd));

% Construct open-loop and closed-loop transer functions.
Go = K*F_lead*F_lag*G;
Gc = feedback(Go,1);

figure, hold on
bode(Go)

%% Exercise 4.1.2
bw = bandwidth(Gc);   % bandwidth
MT = getPeakGain(Gc); % resonance peak
S = stepinfo(Gc);
Tr = S.RiseTime;      % rise time
M = S.Overshoot;      % overshoot

%% Exercise 4.1.3

% This is analogous to Exercise 4.1.1
pmd = 50;

pm = 180+180/pi*angle(evalfr(G,1i*wcd));
beta = (1 - sind(pmd+5.7-pm)) / (1 + sind(pmd+5.7-pm));
t_D = 1/(wcd*sqrt(beta));
F_lead = (t_D*s+1)/(beta*t_D*s+1);

gamma = 0;
t_I = 1/(wcd*tand(5.7));
F_lag = (t_I*s+1)/(t_I*s+gamma);
K = 1/abs(evalfr(F_lead*F_lag*G,1i*wcd));
Go = K*F_lead*F_lag*G;
Gc = feedback(Go,1);

bw = bandwidth(Gc);
MT = getPeakGain(Gc);
S = stepinfo(Gc);
Tr = S.RiseTime;
M = S.Overshoot;

bode(Go)















