%{
    Exercise solutions
    for minimum phase case
%}

close all;
clear all;
clc;

disp('****************MININUM PHASE MODEL****************')

%**************************************************************************
%**********************EXERCISE 3.1 STATIC DECOUPLING**********************
%**************************************************************************

%% Get system transfer matrix
G = minphase;
G0 = dcgain(G);
RGA = G0 .* inv(G0)'

%% 3.1.1
W1 = inv(G0);
W2 = eye(2);
G_tilde = W2 * G * W1;

figure
bode(G_tilde)
grid on

%% 3.1.2
f1_tilde = PIController(G_tilde(1,1), pi/3, 0.1);
f2_tilde = PIController(G_tilde(2,2), pi/3, 0.1);
F_tilde = minreal([f1_tilde 0;0 f2_tilde]);
F = G0 \ F_tilde;

%% 3.1.3
S = minreal(inv(eye(2) + G * F));
T = minreal(S * G * F);

figure
sigma(S,T)
legend('S', 'T')
grid on

%% 3.1.4
sim('closedloop'); % run simulink model

figure

% plot input u
subplot(2,1,1), hold on
plot(uout.Time, uout.Data)
title('Input')
xlabel('time')
ylabel('amplitude')
grid on

% plot output y
subplot(2,1,2), hold on
plot(yout.Time, yout.Data)
title('Output')
xlabel('time')
ylabel('amplitude')
grid on

%**************************************************************************
%**********************EXERCISE 3.1 DYNAMIC DECOUPLING*********************
%**************************************************************************

%% 3.2.1
disp('Exercise 3.2.1:')
W1 = minreal([1, -G(1,2)/G(1,1);
             -G(2,1)/G(2,2), 1]);
W = minreal(tf(W1))
G_tilde = G * W1;
G_tilde0 = dcgain(G_tilde)

figure
bode(G_tilde)
grid on

% fname = '../figures'; % figure directory path
% filename = 'G_bode_min_321'; % file name
% saveas(gca, fullfile(fname, filename), 'epsc') % 'epsc' for colored plots

%% 3.2.2
disp('Exercise 3.2.2:')
f1_tilde = PIController(G_tilde(1,1), pi/3, 0.1);
f2_tilde = PIController(G_tilde(2,2), pi/3, 0.1);
F_tilde = minreal([f1_tilde 0;0 f2_tilde]);
F = W1 * F_tilde;

%% 3.2.3
disp('Exercise 3.2.3:')
S = minreal(inv(eye(2) + G * F));
T = minreal(S * G * F);

figure
sigma(S,T)
legend('S', 'T')
grid on

%% 3.2.4
disp('Exercise 3.2.4:')
sim('closedloop'); % run simulink model

figure

% plot input u
subplot(2,1,1), hold on
plot(uout.Time, uout.Data)
title('Input')
xlabel('time')
ylabel('amplitude')
grid on

% plot output y
subplot(2,1,2), hold on
plot(yout.Time, yout.Data)
title('Output')
xlabel('time')
ylabel('amplitude')
grid on

% % Save figure
% fname = '../figures'; % figure directory path
% filename = 'input_output_min_324'; % file name
% saveas(gca, fullfile(fname, filename), 'epsc') % 'epsc' for colored plots

%**************************************************************************
%***********EXERCISE 3.1 GLOVER-MAFARLANE ROBUST LOOP-SHAPING**************
%**************************************************************************

%% 3.3.1
disp('Exercise 3.3.1:')

L0 = G * F;

% figure
% margin(prescale(L0(1,1)))
% grid on
% figure
% margin(prescale(L0(1,2)))
% grid on
% figure
% margin(prescale(L0(2,1)))
% grid on
% figure
% margin(prescale(L0(2,2)))
% grid on

%% 3.3.2
disp('Exercise 3.3.2:')
[Fr,gam] = rloop(L0,1.1);
F = F * Fr;

%% 3.3.3
disp('Exercise 3.3.3:')
S = minreal(inv(eye(2) + G * F));
T = minreal(S * G * F);

figure
sigma(S,T)
legend('S', 'T')
grid on

%% 3.3.4
disp('Exercise 3.3.4:')
sim('closedloop'); % run simulink model

figure

% plot input u
subplot(2,1,1), hold on
plot(uout.Time, uout.Data)
title('Input')
xlabel('time')
ylabel('amplitude')
grid on

% plot output y
subplot(2,1,2), hold on
plot(yout.Time, yout.Data)
title('Output')
xlabel('time')
ylabel('amplitude')
grid on

% % Save figure
% fname = '../figures'; % figure directory path
% filename = 'input_output_min_334'; % file name
% saveas(gca, fullfile(fname, filename), 'epsc') % 'epsc' for colored plots
