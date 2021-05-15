%{
    Exercise solutions
    for non-minimum phase case
%}

close all;
clear all;
clc;

%**************************************************************************
%*********************EXERCISE 3.1 - NON-MININUM PHASE*********************
%**************************************************************************

%% Exercise 3.1.1.
sys = nonminphase;
G = tf(sys);

pole(G(1,1));
pole(G(1,2));
pole(G(2,1));
pole(G(2,2));

tzero(G(1,1));
tzero(G(1,2));
tzero(G(2,1));
tzero(G(2,2));

%% Exercise 3.1.2
pole(G);
tzero(G);

%% Exercise 3.1.3
hinfnorm(G);

%% Exercise 3.1.4
RGA = G .* inv(G)';
evalfr(RGA, 0);

%% Exercise 3.1.5
figure, hold on
step(G(1,1))
step(G(1,2))
step(G(2,1))
step(G(2,2))
legend('G11', 'G12', 'G21', 'G22')

%**************************************************************************
%*********************EXERCISE 3.2 - NON-MININUM PHASE*********************
%**************************************************************************

%% Exercise 3.2.1
s = tf('s');

wc = 0.02;  % desired cross-over frequency
pm = pi/3; % desired phase margin

% Parameters for controller 1
T12 = 1/wc*tan(-pi - arg(G(2,1),1i*wc) + pi/2 + pm);
K12 = 1/abs(evalfr(G(2,1)*(1+1/(s*T12)), 1i*wc));
f12 = K12*(1 + 1/(s*T12));

% Parameters for controller 2
T21 = 1/wc*tan(-pi - arg(G(1,2),1i*wc) + pi/2 + pm);
K21 = 1/abs(evalfr(G(1,2)*(1+1/(s*T21)), 1i*wc));
f21 = K21*(1 + 1/(s*T21));

% Construct the controller matrix F and open-loop matrix L
F = [0 f12;f21 0];
L = G*F;

% Plot bode of L12 and L21
figure, hold on
bode(L(1,1), L(2,2));
ax = findobj('type','axes');
legend(ax(1), {'L(1,1)', 'L(2,2)'})
legend(ax(2), {'L(1,1)', 'L(2,2)'})
title('')
grid on

fname = '../figures';
filename = 'L_bode_non_321';
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
filename = 'input_output_non_323'; % file name
saveas(gca, fullfile(fname, filename), 'epsc') % 'epsc' for colored plots


