%% 3.1

clear
close all

sys = minphase
% sys = nonminphase


[G_num, G_denom] = tfdata(sys);

G_11 = tf(G_num{1,1}, G_denom{1,1});
G_12 = tf(G_num{1,2}, G_denom{1,2});
G_21 = tf(G_num{2,1}, G_denom{2,1});
G_22 = tf(G_num{2,2}, G_denom{2,2});

% The system transfer matrix
G = [G_11, G_12; G_21, G_22];


W_1 = inv(evalfr(G, 0));

G_tilda = G * W_1;

bode(G_tilda)



%% RGA at w = 0

RGA = evalfr(G,0) .* inv(evalfr(G,0))'

