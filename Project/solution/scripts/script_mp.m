clear
close all

sys = minphase;

wc = 0.1;
pm = pi/3;

%% 1.1
[G_num, G_denom] = tfdata(sys);

G_11 = tf(G_num{1,1}, G_denom{1,1});
G_12 = tf(G_num{1,2}, G_denom{1,2});
G_21 = tf(G_num{2,1}, G_denom{2,1});
G_22 = tf(G_num{2,2}, G_denom{2,2});

% The system transfer matrix
G = [G_11, G_12; G_21, G_22];

% The weight W_1
w_11 = 1;
w_12 = -minreal(G_12 / G_11);
w_21 = -minreal(G_21 / G_22);
w_22 = 1;

W_1 = [w_11 w_12; w_21 w_22]

% Remove minreal to show singular values properly
G_tilda = minreal(G * W_1);

bode(G_tilda)


% The magnitude and phase of G_tilda_ii at the crossover frequency
[~, ph_1] = bode(G_tilda(1,1), wc);
[~, ph_2] = bode(G_tilda(2,2), wc);

% Compute T
T_1 = 1/wc * tan(pm - pi/2 - ph_1 * pi / 180)
T_2 = 1/wc * tan(pm - pi/2 - ph_2 * pi / 180)

% Compute K from the Bode diagram of G_tilda_ii * F / K
s = tf('s');
l_1 = G_tilda(1,1) * (1 + 1 / (s * T_1));
l_2 = G_tilda(2,2) * (1 + 1 / (s * T_2));


[K_1_inv, ~] = bode(l_1, wc);
[K_2_inv, ~] = bode(l_2, wc);

K_1 = 1 / K_1_inv
K_2 = 1 / K_2_inv

% The final controllers
f_tilda_1 = K_1 * (1 + 1 / (s * T_1));
f_tilda_2 = K_2 * (1 + 1 / (s * T_2));

F_tilda = [f_tilda_1, 0; 0, f_tilda_2];

F = W_1 * F_tilda;

L = minreal(G * F);


% figure
% margin(L(1,1))
% hold on
% margin(L(2,2))


% %% The sensitivity function
% S = minreal(inv(eye(2) + L));
%
% %% The complementary sensitivity function
% T = minreal(inv(eye(2) + L) * L);
%
% figure
% sigma(S)
% hold on
% sigma(T)
% grid
% % axis([0.001 10 -60 10])

%% Step responses
sim('closedloop')
figure
plot(yout); grid
