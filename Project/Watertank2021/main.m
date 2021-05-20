close all;
clear all;
clc

load('fourTankOutput.mat')
SimPara

h10 = 25/100 * y1(end);
h20 = 25/100 * y2(end);
h30 = 25/100 * y3(end);
h40 = 25/100 * y4(end);

u10 = 15 * 0.4;
u20 = 15 * 0.4;

a3 = (1-gam2)*k2/sqrt(2*g*h30)*u20;
a4 = (1-gam1)*k1/sqrt(2*g*h40)*u10;

a1 = 1/sqrt(2*g*h10)*(a3*sqrt(2*g*h30)+gam1*k1*u10);
a2 = 1/sqrt(2*g*h20)*(a4*sqrt(2*g*h40)+gam2*k2*u20);




