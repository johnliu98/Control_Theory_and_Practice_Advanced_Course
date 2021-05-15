a

u1 = 7.5;
u2 = 7.5;

gamma = 0.625;

syms h1 h2 h3 h4
S_mp = solve(...
    -a1 * sqrt(2*g*h1) + a3 * sqrt(2*g*h3) + gamma * K_1 * u1 == 0, ...
    -a2 * sqrt(2*g*h2) + a4 * sqrt(2*g*h4) + gamma * K_2 * u2 == 0, ...
    -a3 * sqrt(2*g*h3) + (1-gamma) * K_2 * u2 == 0, ...
    -a4 * sqrt(2*g*h4) + (1-gamma) * K_1 * u1 == 0);

h1_mp = double(S_mp.h1)
h2_mp = double(S_mp.h2)
h3_mp = double(S_mp.h3)
h4_mp = double(S_mp.h4)


return

gamma = 0.375;

syms h1 h2 h3 h4
S_nmp = solve(...
    -a4_nmp * sqrt(2*g*h1) + a4_nmp * sqrt(2*g*h3) + gamma * K_1 * u1 == 0, ...
    -a4_nmp * sqrt(2*g*h2) + a4_nmp * sqrt(2*g*h4) + gamma * K_2 * u2 == 0, ...
    -a4_nmp * sqrt(2*g*h3) + (1-gamma) * K_2 * u2 == 0, ...
    -a4_nmp * sqrt(2*g*h4) + (1-gamma) * K_1 * u1 == 0);


h1_nmp = double(S_nmp.h1)
h2_nmp = double(S_nmp.h2)
h3_nmp = double(S_nmp.h3)
h4_nmp = double(S_nmp.h4)