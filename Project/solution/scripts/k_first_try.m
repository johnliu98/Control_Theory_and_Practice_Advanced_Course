clear 
close all

%% Minimum phase 

%% 2.1.7

max_height_1 = 23;
max_height_2 = 24;
A = 15.52;
gamma = 0.625;
u_max = 15;

% K_1
K1_50_file = load('k1_50.mat');
K1_30_file = load('k1_30.mat');

slope_1_50 = ...
    ((K1_50_file.Y(20,1) - K1_50_file.Y(10,1)) / (K1_50_file.t(20) - K1_50_file.t(10))) * max_height_1 / 100;
slope_1_30 = ...
    ((K1_30_file.Y(20,1) - K1_30_file.Y(10,1)) / (K1_30_file.t(20) - K1_30_file.t(10))) * max_height_1 / 100;

K_1_50 = slope_1_50 * A / gamma / (u_max * 0.5);
K_1_30 = slope_1_30 * A / gamma / (u_max * 0.3);

K_1 = (K_1_50 + K_1_30) / 2


% K_2
K2_50_file = load('k2_50.mat');
K2_30_file = load('k2_30.mat');

slope_2_50 = ...
    ((K2_50_file.Y(20,2) - K2_50_file.Y(10,2)) / (K2_50_file.t(20) - K2_50_file.t(10))) * max_height_2 / 100;
slope_2_30 = ...2.0
    ((K2_30_file.Y(20,2) - K2_30_file.Y(10,2)) / (K2_30_file.t(20) - K2_30_file.t(10))) * max_height_2 / 100;

K_2_50 = slope_2_50 * A / gamma / (u_max * 0.5);
K_2_30 = slope_2_30 * A / gamma / (u_max * 0.3);

K_2 = (K_2_50 + K_2_30) / 2