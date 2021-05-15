%{
    Exercise solutions
    for minimum phase case
%}

close all;
clear all;
clc;

%**************************************************************************
%***********************EXERCISE 3.1 - MININUM PHASE***********************
%**************************************************************************

%% Exercise 3.1.1.
sys = minphase;
G = tf(sys);

% Calculate poles for subsystems
pole(G(1,1));
pole(G(1,2));
pole(G(2,1));
pole(G(2,2));

% Calculate zeros for subsystems
tzero(G(1,1));
tzero(G(1,2));
tzero(G(2,1));
tzero(G(2,2));

%% Exercise 3.1.2
pole(G);  % poles for transfer matrix G
tzero(G); % zeros for transfer matrix G

%% Exercise 3.1.3
hinfnorm(G); % H infinity norm of G

%% Exercise 3.1.4
RGA = G .* inv(G)'; % Relative Gain Array w.r.t. G
evalfr(RGA, 0);     % RGA(0)

%% Exercise 3.1.5

% Plot step response of subsystems
figure, hold on
step(G(1,1))
step(G(1,2))
step(G(2,1))
step(G(2,2))
legend('G11', 'G12', 'G21', 'G22')

%*************************************************************************
%***********************EXERCISE 3.2 - MININUM PHASE***********************
%**************************************************************************

%% Exercise 3.2.1
s = tf('s');

wc = 0.1;  % desired cross-over frequency
pm = pi/3; % desired phase margin

% Parameters for controller 1
T11 = 1/wc*tan(-pi - arg(G(1,1),1i*wc) + pi/2 + pm);
K11 = 1/abs(evalfr(G(1,1)*(1+1/(s*T11)), 1i*wc));
f11 = K11*(1 + 1/(s*T11));

% Parameters for controller 2
T22 = 1/wc*tan(-pi - arg(G(2,2),1i*wc) + pi/2 + pm);
K22 = 1/abs(evalfr(G(2,2)*(1+1/(s*T22)), 1i*wc));
f22 = K22*(1 + 1/(s*T22));

% Construct the controller matrix F and open-loop matrix L
F = [f11 0;0 f22];
L = G*F;

% Plot bode of L11 and L22
figure
bode(L(1,1), L(2,2));
ax = findobj('type','axes');
legend(ax(1), {'L(1,1)', 'L(2,2)'})
legend(ax(2), {'L(1,1)', 'L(2,2)'})
title('')
grid on

fname = '../figures';
filename = 'L_bode_min_321';
saveas(gca, fullfile(fname, filename), 'epsc')

%% Exercise 3.2.2
S = 1 / (eye(2) + L); % sensitivity function
T = eye(2) - S;       % complementary sensitivity function

% Plot singular values for S and T
figure, hold on
sigma(S)
sigma(T)
legend('S', 'T')
grid on

%% Exercise 3.2.3
sim('closedloop'); % run simulink model

figure, hold on
% Plot input u
subplot(2,1,1), hold on
plot(u.time, u.signals.values)
title('Input')
xlabel('time')
ylabel('amplitude')
grid on

% Plot output y
subplot(2,1,2), hold on
plot(y.time, y.signals.values)
title('Output')
xlabel('time')
ylabel('amplitude')
grid on

% Save figure
fname = '../figures'; % figure directory path
filename = 'input_output_min_323'; % file name
saveas(gca, fullfile(fname, filename), 'epsc') % 'epsc' for colored plots









