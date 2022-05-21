% general plot file

%% plot case 1

load("data_log/data_sine_wave_freq_15.mat")



% data clear 
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one

mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2); 
figure()
plot(mechanics_lung.Time,mechanics_lung.Data(:,1),'--')
hold on
for i=2:length(mechanics_lung.Data(1,:))
    plot(mechanics_lung.Time,mechanics_lung.Data(:,i))
end
hold off
legend({'P_{aO}','Flux', 'Volume'},'Location','southeast')
xlabel('t[s]')
title('Flow and volume')
yyaxis left
ylim([-1.5;1.5])
ylabel('Volume [L]')
yyaxis right
ylim([-1.5;1.5])
ylabel('Flux [L/s]')
grid on


%% 

load("data_log/data_sine_wave_freq_30.mat")

% data clear 
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one

mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2); 
figure()
plot(mechanics_lung.Time,mechanics_lung.Data(:,1),'--')
hold on
for i=2:length(mechanics_lung.Data(1,:))
    plot(mechanics_lung.Time,mechanics_lung.Data(:,i))
end
hold off
legend({'P_{aO}','Flux', 'Volume'},'Location','southeast')
xlabel('t[s]')
title('Flow and volume')
yyaxis left
ylim([-2.5;2.5])
ylabel('Volume [L]')
yyaxis right
ylim([-2.5;2.5])
ylabel('Flux [L/s]')
grid on

%% 
%exportgraphics(figure(7),'data_log/data_sine_wave_freq_15_zoom.pdf','BackgroundColor','none','ContentType','vector');