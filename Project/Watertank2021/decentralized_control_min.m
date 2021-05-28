close all;
clear all;
clc;

%% --- Step reponse --- %
load('data/StepResponse_min.mat')

% for i=1:numel(yref1)
%     if yref1(i)==45
%         s1 = i;
%         break
%     end
% end
% for i=1:numel(yref2)
%     if yref2(i)==45
%         s2 = i;
%         break
%     end
% end
% 
% figure, hold on
% plot(t, y1, 'Color', [0, 0.4470, 0.7410])
% plot(t, y2, '--', 'Color', [0, 0.4470, 0.7410])
% plot(t, yref1, 'Color', [0.9290, 0.6940, 0.1250])
% plot(t, yref2, '--', 'Color', [0.9290, 0.6940, 0.1250])
% xlabel('Time [s]')
% ylabel('Y [%]')
% ylim([35 50])
% legend('Tank1', 'Tank2', 'Ref1', 'Ref2')
% grid on
% 
% xlim([210 250])
% saveas(gca, fullfile('figures', 'step_reponse_min_1.eps'), 'epsc') % 'epsc' for colored plots
% 
% xlim([260 300])
% saveas(gca, fullfile('figures', 'step_reponse_min_2.eps'), 'epsc')

% stepinfo((y1(s1:s1+400)-40)/5, t(1:401))
% stepinfo((y2(s2:s2+400)-40)/5, t(1:401))

%% --- Pour water --- %
% load('data/PourWater_min.mat')
% 
% t = t - min(t);
% 
% figure, hold on
% plot(t, y1, 'Color', [0, 0.4470, 0.7410])
% plot(t, y2, '--', 'Color', [0, 0.4470, 0.7410])
% plot(t, u1, 'Color', [0.4940, 0.1840, 0.5560])
% plot(t, u2, '--', 'Color', [0.4940, 0.1840, 0.5560])
% plot(t, yref1, 'Color', [0.9290, 0.6940, 0.1250])
% xlabel('Time [s]')
% ylabel('Y [%]')
% ylim([0 80])
% grid on
% legend('Tank1', 'Tank2', 'Input1', 'Input2', 'Ref')
% 
% xlim([100 200])
% saveas(gca, fullfile('figures', 'pour_water_min_1.eps'), 'epsc')
% 
% xlim([200 300])
% saveas(gca, fullfile('figures', 'pour_water_min_2.eps'), 'epsc')

%% --- Extra outlet --- %
% load('data/ExtraOutlet_min.mat')
% 
% t = t - min(t);
% figure, hold on
% plot(t, y1, 'Color', [0, 0.4470, 0.7410])
% plot(t, y2, '--', 'Color', [0, 0.4470, 0.7410])
% plot(t, u1, 'Color', [0.4940, 0.1840, 0.5560])
% plot(t, u2, '--', 'Color', [0.4940, 0.1840, 0.5560])
% plot(t, yref1, 'Color', [0.9290, 0.6940, 0.1250])
% xlabel('Time [s]')
% ylabel('Y [%]')
% ylim([0 55])
% grid on
% legend('Tank1', 'Tank2', 'Input1', 'Input2', 'Ref')
% 
% xlim([40 140])
% saveas(gca, fullfile('figures', 'extra_outlet_min_1.eps'), 'epsc')
% 
% xlim([210 310])
% saveas(gca, fullfile('figures', 'extra_outlet_min_2.eps'), 'epsc')

%% --- Robust step response --- %
% load('data/StepResponse_robmin.mat')
% 
% for i=1:numel(yref1)
%     if yref1(i)==45
%         s1 = i;
%         break
%     end
% end
% for i=1:numel(yref2)
%     if yref2(i)==45
%         s2 = i;
%         break
%     end
% end
% 
% figure, hold on
% plot(t, y1, 'Color', [0, 0.4470, 0.7410])
% plot(t, y2, '--', 'Color', [0, 0.4470, 0.7410])
% plot(t, yref1, 'Color', [0.9290, 0.6940, 0.1250])
% plot(t, yref2, '--', 'Color', [0.9290, 0.6940, 0.1250])
% xlabel('Time [s]')
% ylabel('Y [%]')
% ylim([35 50])
% legend('Tank1', 'Tank2', 'Ref1', 'Ref2')
% grid on
% 
% xlim([213 253])
% saveas(gca, fullfile('figures', 'step_reponse_robmin_1.eps'), 'epsc') % 'epsc' for colored plots
% % 
% xlim([286 326])
% saveas(gca, fullfile('figures', 'step_reponse_robmin_2.eps'), 'epsc')
% 
% stepinfo((y1(s1:s1+400)-40)/5, t(1:401))
% stepinfo((y2(s2:s2+400)-40)/5, t(1:401))

%% --- Robust Pour water --- %
% load('data/PourWater_robmin.mat')
% 
% t = t - min(t);
% 
% figure, hold on
% plot(t, y1, 'Color', [0, 0.4470, 0.7410])
% plot(t, y2, '--', 'Color', [0, 0.4470, 0.7410])
% plot(t, u1, 'Color', [0.4940, 0.1840, 0.5560])
% plot(t, u2, '--', 'Color', [0.4940, 0.1840, 0.5560])
% plot(t, yref1, 'Color', [0.9290, 0.6940, 0.1250])
% xlabel('Time [s]')
% ylabel('Y [%]')
% ylim([0 80])
% grid on
% legend('Tank1', 'Tank2', 'Input1', 'Input2', 'Ref')
% 
% xlim([100 200])
% saveas(gca, fullfile('figures', 'pour_water_robmin_1.eps'), 'epsc')
% 
% xlim([217 317])
% saveas(gca, fullfile('figures', 'pour_water_robmin_2.eps'), 'epsc')

%% --- Robust Extra outlet --- %
load('data/ExtraOutlet_robmin.mat')

t = t - min(t);
figure, hold on
plot(t, y1, 'Color', [0, 0.4470, 0.7410])
plot(t, y2, '--', 'Color', [0, 0.4470, 0.7410])
plot(t, u1, 'Color', [0.4940, 0.1840, 0.5560])
plot(t, u2, '--', 'Color', [0.4940, 0.1840, 0.5560])
plot(t, yref1, 'Color', [0.9290, 0.6940, 0.1250])
xlabel('Time [s]')
ylabel('Y [%]')
ylim([0 55])
grid on
legend('Tank1', 'Tank2', 'Input1', 'Input2', 'Ref')

xlim([65 165])
saveas(gca, fullfile('figures', 'extra_outlet_robmin_1.eps'), 'epsc')

xlim([274 374])
saveas(gca, fullfile('figures', 'extra_outlet_robmin_2.eps'), 'epsc')








