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
SimPara

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
G0 = evalfr(G, 0);

RGA = G0 .* inv(G0)'

figure, hold on
step(G(1,1))
step(G(1,2))
step(G(2,1))
step(G(2,2))
legend('In 1 to Out 1', 'In 1 to Out 2', 'In 2 to Out 1', 'In 2 to Out 2')
grid on
% matlab2tikz('figures\step_nonmin.tex','showInfo', false);























   