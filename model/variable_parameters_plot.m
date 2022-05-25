%  plot file

%% Rc
close all
stringInit='_Rp_0.5_Cs_0.005_Cw_0.02_CL_0.02.mat';
file_list= dir(strcat('data_log/*',stringInit));

filename='';
for i=1:length(file_list)
filename{i}=file_list(i).name;
filepath=strcat('data_log/',filename{i});
load(filepath)
resistance_Rc(i)=erase(filename(i),stringInit);
resistance_Rc(i)=erase(resistance_Rc(i),'data_');
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one
mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2); 
pressure_resistance_Rc{i}=mechanics_lung.Data(:,1);
flux_resistance_Rc{i}=mechanics_lung.Data(:,2);
volume_resistance_Rc{i}=mechanics_lung.Data(:,3);
time_resistance_Rc{i}=mechanics_lung.Time;
resistance_Rc(i)=strrep(resistance_Rc(i),'_','=');
resistance_Rc(i)=strcat(resistance_Rc(i),' [cmH2O s/L]');
clear mechanics_lung
end
%% FLUX
close all
figure;
for i=1:length(file_list)
plot(time_resistance_Rc{i},flux_resistance_Rc{i})
hold on
end
hold off
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying R_c')
legend(resistance_Rc,'Location','southeast')
ylim([-12, 5])

x0=100;
y0=100;
width=1400;
height=400;
set(gcf,'position',[x0,y0,width,height])


figure;
for i=1:2:length(file_list)
plot(time_resistance_Rc{i},flux_resistance_Rc{i})
hold on
end
hold off
ylim([-0.5, 3])
xlim([3.1,3.7])
legend(resistance_Rc{1:2:end},'Location','northwest')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying R_c: zoom over 2^{nd} inspiratory peak')

figure;
for i=1:2:length(file_list)
plot(time_resistance_Rc{i},flux_resistance_Rc{i})
hold on
end
hold off
ylim([-12, 1])
xlim([3.5,5.5])
legend(resistance_Rc{1:2:end},'Location','southeast')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying R_c : zoom over 2^{nd} expiratory peak')

%% 

%% VOLUME
close all
figure;
for i=1:length(file_list)
plot(time_resistance_Rc{i},volume_resistance_Rc{i})
hold on
end
hold off
xlabel('t [s]')
ylabel('Volume [L]')
title('Volume by varying R_c')
legend(resistance_Rc,'Location','northeast')

x0=100;
y0=100;
width=1400;
height=400;
set(gcf,'position',[x0,y0,width,height])

figure;
for i=1:2:length(file_list)
plot(time_resistance_Rc{i},volume_resistance_Rc{i})
hold on
end
hold off
ylim([0, 0.4])
xlim([3,5])
legend(resistance_Rc{1:2:end})
xlabel('t [s]')
ylabel('Volume [L]')
title('Volume by varying R_c: zoom over 2^{nd} inspiratory peak')