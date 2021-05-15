clear
close all

s = tf('s')

%% The process to be controlled
G = 3*(1-s)/((5*s + 1) * (10*s + 1))

Ti = 2;

%% The desired crossover frequency
wc = 0.4;

%% The lag component
C2 = (Ti*s + 1) / (Ti*s);

%% The magnitude and the phase of G * C2(lag) at
% the desired crossover frequency
[mag, ph] = bode(G * C2, wc)

%% The desired phase margin
ph_desired = 50;

ph = ph - 180;
phi = ph_desired - ph;

%% Compute the rest of the coefficients: b, Td and K
b = (1 - sin(phi * pi / 180)) / (1 + sin(phi * pi / 180))
Td = 1 / (wc * sqrt(b))
K = sqrt(b) / mag

C1 = K * (Td * s + 1) / (b * Td * s + 1);

C = C1 * C2;

%% Plot the frequency and step responses (after and before)
figure
margin(G*C);
hold on
margin(G);
hold off

figure
step(G*C / (1 + G*C));
hold on
step(G);
grid
hold off

%% Get information required

% Bandwidth
wb = bandwidth(G*C / (1 + G*C))

% Resonance peak
mt = 20*log10(getPeakGain(G*C / (1 + G*C)))

% Step info
stepinfo((G*C / (1 + G*C)))