clear 
close all

%% Minimum phase 

%% 2.1.7

max_height_1 = 21.5;
max_height_2 = 21.5;
A = 15.52;
gamma = 0.625;
u_max = 15;

% K_1
K1_50_file = load('k1.mat');
kk1 = [K1_50_file.t K1_50_file.Y(:,1)];


slope_1_50 = ...
    (kk1(30,2) - kk1(10,2)) / (kk1(30,1) - kk1(10,1)) * max_height_1 / 100;

K_1 = slope_1_50 * A / (u_max * 0.5)



% K_2
K2_50_file = load('k2.mat');

kk2 = [K2_50_file.t K2_50_file.Y(:,1)];


slope_2_50 = ...
    (kk2(28,2) - kk2(10,2)) / (kk2(28,1) - kk2(10,1)) * max_height_2 / 100;

K_2 = slope_2_50 * A / (u_max * 0.5)

