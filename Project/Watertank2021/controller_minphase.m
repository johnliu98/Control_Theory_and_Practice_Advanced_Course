close all;
clear all;
clc;

%% Add path to "matlab2tikz" package
paths = split(path,';');
expr = 'plottools$';
for i=1:numel(paths)
    if ~isempty(regexp(paths{i},expr,'once'))
        matlab2tikz_path = paths{i};
        break
    end
end
if exist('matlab2tikz_path','var')
    matlab2tikz_path = strcat(matlab2tikz_path,'\matlab2tikz\src');
    addpath(matlab2tikz_path,'-end')
end

%% --- Define system --- %
SysParaMin

A = [-1/T1 0 A3/(A1*T3) 0;
     0 -1/T2 0 A4/(A2*T4);
     0 0 -1/T3 0;
     0 0 0 -1/T4];
B = [gam1*k1/A1 0;
     0 gam2*k2/A2;
     0 (1-gam2)*k2/A3;
     (1-gam1)*k1/A4 0];
C = [kc 0 0 0;
     0 kc 0 0];
D = 0;

G = ss(A, B, C, D);
G0 = dcgain(G);
G = minreal(tf(G));
RGA = G .* inv(G)';

%% --- Decentralized conrol --- %
pm = 65;
wc = 0.12;

W1 = minreal([1, -G(1,2)/G(1,1);
             -G(2,1)/G(2,2), 1]);
W1 = minreal(tf(W1));
G_tilde = G * W1;
G_tilde0 = dcgain(G_tilde);

f1_tilde = PIController(G_tilde(1,1), pm*pi/180, wc);
f2_tilde = PIController(G_tilde(2,2), pm*pi/180, wc);
F_tilde = minreal([f1_tilde 0;0 f2_tilde]);
F = minreal(W1 * F_tilde)

F = ss(F,'min');
[A,B,C,D] = ssdata(F);
save controllers/regMin.mat A B C D

Gc = minreal((eye(2)+G*F) \ G*F);

stepinfo(Gc(1,1)).RiseTime
stepinfo(Gc(1,1)).SettlingTime
stepinfo(Gc(1,1)).Overshoot

% figure, hold on
% step(Gc(1,1))
% step(Gc(2,2))
% grid on
% 
% S = minreal(inv(eye(2) + G * F));
% T = minreal(S * G * F);
% figure
% sigma(S,T)
% xlim([0.001 100])
% legend('S', 'T')
% grid on

%% --- Robust control --- %
L = G * F;
[Fr,gam] = rloop(L,1.1);
F = F * Fr;
F = ss(F,'min');
[A,B,C,D] = ssdata(F);
save controllers/regRobustMin.mat A B C D

Gc = minreal((eye(2)+G*F) \ G*F);

% stepinfo(Gc(1,1)).RiseTime
% stepinfo(Gc(1,1)).SettlingTime
% stepinfo(Gc(1,1)).Overshoot

% S = minreal(inv(eye(2) + G * F));
% T = minreal(S * G * F);
% figure
% sigma(S,T)
% xlim([0.001 100])
% legend('S', 'T')
% grid on










