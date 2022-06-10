% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Mastrofini Alessandro
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Medical Engineering - University of Rome Tor Vergata
% Physiological Systems Modeling and Simulation
% F. Caselli, MSSF A.Y. 2021/2022
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% plot case 1
close all
load("data_log/data_sine_wave_freq_15.mat")
mechanics_lung_1=mechanics_lung;

load("data_log/data_square_wave_freq_18.mat")
mechanics_lung_2=mechanics_lung;

% data clear 
noise_point=find(mechanics_lung_1.Data(:,2)==min(mechanics_lung_1.Data(:,2)));
noise_point_1=find(mechanics_lung_2.Data(:,2)==min(mechanics_lung_2.Data(:,2)));

% replace extremely noise point with the previous one

mechanics_lung_1.Data(noise_point,2)=mechanics_lung_1.Data(noise_point-1,2); 
mechanics_lung_2.Data(noise_point_square,2)=mechanics_lung_2.Data(noise_point_square-1,2); 

figure()
plot(mechanics_lung_1.Data(1:end/2,1),mechanics_lung_1.Data(1:end/2,3))
hold on
plot(mechanics_lung_2.Data(1:end/2,1),mechanics_lung_2.Data(1:end/2,3))
xlabel('Pressure [cm H2O]')
ylabel('Volume [L]')
title('Pressure vs volume')
grid on
box off
legend({'P_{aO} \propto sine wave','P_{aO} \propto square wave'},'Location','southeast')
exportgraphics(figure(1),'data_log/PV_sine_vs_square.pdf','BackgroundColor','none','ContentType','vector');

%%
close all
load("data_log/data_square_wave_rise_30_Tinsp_40_PEEP_5_Paw_25_freq_18.mat")
mechanics_lung_1=mechanics_lung;

load("data_log/data_square_wave_rise_0_Tinsp_40_PEEP_5_Paw_25_freq_18.mat")
mechanics_lung_2=mechanics_lung;

load("data_log/data_square_wave_rise_15_Tinsp_40_PEEP_5_Paw_25_freq_18.mat")
mechanics_lung_3=mechanics_lung;

% data clear 
noise_point=find(mechanics_lung_1.Data(:,2)==min(mechanics_lung_1.Data(:,2)));
noise_point_1=find(mechanics_lung_2.Data(:,2)==min(mechanics_lung_2.Data(:,2)));
noise_point_2=find(mechanics_lung_3.Data(:,2)==min(mechanics_lung_3.Data(:,2)));

% replace extremely noise point with the previous one

mechanics_lung_1.Data(noise_point,2)=mechanics_lung_1.Data(noise_point-1,2); 
mechanics_lung_2.Data(noise_point_1,2)=mechanics_lung_2.Data(noise_point_1-1,2); 
mechanics_lung_3.Data(noise_point_2,2)=mechanics_lung_3.Data(noise_point_2-1,2); 

figure()
plot(mechanics_lung_1.Data(1:end/2,1),mechanics_lung_1.Data(1:end/2,3))
hold on
plot(mechanics_lung_3.Data(1:end/2,1),mechanics_lung_3.Data(1:end/2,3))

plot(mechanics_lung_2.Data(1:end/2,1),mechanics_lung_2.Data(1:end/2,3))

xlabel('Pressure [cm H2O]')
ylabel('Volume [L]')
title('Pressure vs volume')
grid on
box off
legend({'\tau = 0.3 * T_{insp}','\tau = 0.1 * T_{insp}','\tau = 0'},'Location','north')
xlim([0;30])
%% 
%exportgraphics(figure(7),'data_log/data_sine_wave_freq_15_zoom.pdf','BackgroundColor','none','ContentType','vector');