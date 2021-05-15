a

h1 = (0.5 + 0.095) * 23;
h2 = (0.5 + 0.15) * 24;

syms h3 h4 u1 u2
S = solve(...
    -a1 * sqrt(2*g*h1) + a3 * sqrt(2*g*h3) + gamma * K_1 * u1 == 0, ...
    -a2 * sqrt(2*g*h2) + a4 * sqrt(2*g*h4) + gamma * K_2 * u2 == 0, ...
    -a3 * sqrt(2*g*h3) + (1-gamma) * K_2 * u2 == 0, ...
    -a4 * sqrt(2*g*h4) + (1-gamma) * K_1 * u1 == 0);

h3 = double(S.h3)
h4 = double(S.h4)

u1 = double(S.u1) / 15 * 100
u2 = double(S.u2) / 15 * 100
