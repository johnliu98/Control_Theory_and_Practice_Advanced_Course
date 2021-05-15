script_nmp

[Fr_ss, gamma] = rloop(L, 1.1)

Fr = minreal(tf(Fr_ss))

F = F * Fr;

%% Step responses
sim('closedloop')
figure
plot(yout); grid