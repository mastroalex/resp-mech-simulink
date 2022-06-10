% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Mastrofini Alessandro
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Medical Engineering - University of Rome Tor Vergata
% Physiological Systems Modeling and Simulation
% F. Caselli, MSSF A.Y. 2021/2022
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Rc
close all
clear all
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
noise_point=find(mechanics_lung.Data(:,4)==min(mechanics_lung.Data(:,4)));
mechanics_lung.Data(noise_point,4)=mechanics_lung.Data(noise_point-1,4); 
pressure_resistance_Rc{i}=mechanics_lung.Data(:,1);
flux_resistance_Rc{i}=mechanics_lung.Data(:,2);
flux_alveolar_resistance_Rc{i}=mechanics_lung.Data(:,4);
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

 exportgraphics(figure(1),'data_log/Rc_flux_total.pdf','BackgroundColor','none','ContentType','vector');

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

 exportgraphics(figure(2),'data_log/Rc_flux_zoom1.pdf','BackgroundColor','none','ContentType','vector');


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
 exportgraphics(figure(3),'data_log/Rc_flux_zoom2.pdf','BackgroundColor','none','ContentType','vector');

figure;
for i=1:2:length(file_list)
plot(time_resistance_Rc{i},flux_alveolar_resistance_Rc{i})
hold on
end
hold off
ylim([-0.5, 3])
xlim([3.1,3.7])
legend(resistance_Rc{1:2:end},'Location','northwest')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Alveolar flux by varying R_c: zoom over 2^{nd} inspiratory peak')
 exportgraphics(figure(4),'data_log/Rc_flux_alveolar_zoom.pdf','BackgroundColor','none','ContentType','vector');


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

 exportgraphics(figure(1),'data_log/Rc_volume_total.pdf','BackgroundColor','none','ContentType','vector');


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
 exportgraphics(figure(2),'data_log/Rc_volume_zoom.pdf','BackgroundColor','none','ContentType','vector');

%% 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%% Rp
close all
clear all
stringInit_1='data_Rc_1_';
stringInit_2='_Cs_0.005_Cw_0.02_CL_0.02.mat';
file_list= dir(strcat('data_log/*',stringInit_1,'*',stringInit_2));

filename='';
for i=1:length(file_list)
filename{i}=file_list(i).name;
filepath=strcat('data_log/',filename{i});
load(filepath)
resistance_Rp(i)=erase(filename(i),stringInit_1);
resistance_Rp(i)=erase(resistance_Rp(i),stringInit_2);
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one
mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2);
noise_point=find(mechanics_lung.Data(:,4)==min(mechanics_lung.Data(:,4)));
mechanics_lung.Data(noise_point,4)=mechanics_lung.Data(noise_point-1,4); 
pressure_resistance_Rp{i}=mechanics_lung.Data(:,1);
flux_resistance_Rp{i}=mechanics_lung.Data(:,2);
flux_alveolar_resistance_Rp{i}=mechanics_lung.Data(:,4);
volume_resistance_Rp{i}=mechanics_lung.Data(:,3);
time_resistance_Rp{i}=mechanics_lung.Time;
resistance_Rp(i)=strrep(resistance_Rp(i),'_','=');
resistance_Rp(i)=strcat(resistance_Rp(i),' [cmH2O s/L]');
clear mechanics_lung
end
%% FLUX
close all
figure;
for i=1:length(file_list)
plot(time_resistance_Rp{i},flux_resistance_Rp{i})
hold on
end
hold off
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying R_p')
legend(resistance_Rp,'Location','southeast')
ylim([-12, 5])

x0=100;
y0=100;
width=1400;
height=400;
set(gcf,'position',[x0,y0,width,height])


figure;
for i=1:2:length(file_list)
plot(time_resistance_Rp{i},flux_resistance_Rp{i})
hold on
end
hold off
ylim([-0.5, 3])
xlim([3.1,3.7])
legend(resistance_Rp{1:2:end},'Location','northwest')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying R_p: zoom over 2^{nd} inspiratory peak')

figure;
for i=1:2:length(file_list)
plot(time_resistance_Rp{i},flux_resistance_Rp{i})
hold on
end
hold off
ylim([-12, 1])
xlim([3.5,5.5])
legend(resistance_Rp{1:2:end},'Location','southeast')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying R_p : zoom over 2^{nd} expiratory peak')

figure;
for i=1:2:length(file_list)
plot(time_resistance_Rp{i},flux_alveolar_resistance_Rp{i})
hold on
end
hold off
ylim([-0.5, 3])
xlim([3.1,3.7])
legend(resistance_Rp{1:2:end},'Location','northwest')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Alveolar flux by varying R_p: zoom over 2^{nd} inspiratory peak')


exportgraphics(figure(1),'data_log/Rp_flux_total.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(2),'data_log/Rp_flux_zoom1.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(3),'data_log/Rp_flux_zoom2.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(4),'data_log/Rp_flux_alveolar_zoom.pdf','BackgroundColor','none','ContentType','vector');

%% 

%% VOLUME
close all
figure;
for i=1:length(file_list)
plot(time_resistance_Rp{i},volume_resistance_Rp{i})
hold on
end
hold off
xlabel('t [s]')
ylabel('Volume [L]')
title('Volume by varying R_p')
legend(resistance_Rp,'Location','northeast')

x0=100;
y0=100;
width=1400;
height=400;
set(gcf,'position',[x0,y0,width,height])

 exportgraphics(figure(1),'data_log/Rp_volume_total.pdf','BackgroundColor','none','ContentType','vector');


figure;
for i=1:2:length(file_list)
plot(time_resistance_Rp{i},volume_resistance_Rp{i})
hold on
end
hold off
ylim([0, 0.4])
xlim([3,5])
legend(resistance_Rp{1:2:end})
xlabel('t [s]')
ylabel('Volume [L]')
title('Volume by varying R_p: zoom over 2^{nd} inspiratory peak')
 exportgraphics(figure(2),'data_log/Rp_volume_zoom.pdf','BackgroundColor','none','ContentType','vector');

%% 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%% Cw and CL

close all
clear all
stringInit_1='data_Rc_1_Rp_0.5_Cs_0.005_';
file_list= dir(strcat('data_log/*',stringInit_1,'*'));

filename='';
for i=1:length(file_list)
filename{i}=file_list(i).name;
filepath=strcat('data_log/',filename{i});
load(filepath)
capacitance_CwCL(i)=erase(filename(i),stringInit_1);
capacitance_CwCL(i)=erase(capacitance_CwCL(i),'.mat');
value_string(i)=extract(capacitance_CwCL(i), 'Cw_' +digitsPattern(1)+'.'+digitsPattern(2));
value_string(i)=erase(value_string(i),'Cw_');
value=str2num(value_string{i});
value=1/((1/value)+(1/value));
capacitance_CwCL{i}=string(value);
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one
mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2); 
noise_point=find(mechanics_lung.Data(:,4)==min(mechanics_lung.Data(:,4)));
mechanics_lung.Data(noise_point,4)=mechanics_lung.Data(noise_point-1,4); 
pressure_capacitance_CwCL{i}=mechanics_lung.Data(:,1);
flux_capacitance_CwCL{i}=mechanics_lung.Data(:,2);
flux_alveolar_capacitance_CwCL{i}=mechanics_lung.Data(:,2);
volume_capacitance_CwCL{i}=mechanics_lung.Data(:,3);
time_capacitance_CwCL{i}=mechanics_lung.Time;
capacitance_CwCL{i}=strcat('C_T=',capacitance_CwCL{i},' [L/cmH2O]');
clear mechanics_lung
end
%% FLUX
close all
figure;
for i=1:length(file_list)
plot(time_capacitance_CwCL{i},flux_capacitance_CwCL{i})
hold on
end
hold off
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying C_T')
legend(capacitance_CwCL,'Location','southeast')
ylim([-20, 8])

x0=100;
y0=100;
width=1400;
height=400;
set(gcf,'position',[x0,y0,width,height])


figure;
for i=1:2:length(file_list)
plot(time_capacitance_CwCL{i},flux_capacitance_CwCL{i})
hold on
end
hold off
ylim([-0.5, 8])
xlim([3.1,3.7])
legend(capacitance_CwCL{1:2:end},'Location','northwest')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying C_T: zoom over 2^{nd} inspiratory peak')

figure;
for i=1:2:length(file_list)
plot(time_capacitance_CwCL{i},flux_capacitance_CwCL{i})
hold on
end
hold off
ylim([-15, 1])
xlim([3.5,5.5])
legend(capacitance_CwCL{1:2:end},'Location','southeast')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux by varying C_T : zoom over 2^{nd} expiratory peak')

figure;
for i=1:2:length(file_list)
plot(time_capacitance_CwCL{i},flux_alveolar_capacitance_CwCL{i})
hold on
end
hold off
ylim([-0.5, 8])
xlim([3.1,3.7])
legend(capacitance_CwCL{1:2:end},'Location','northwest')
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Alveolar flux by varying C_T : zoom over 2^{nd} expiratory peak')

exportgraphics(figure(1),'data_log/CwCL_flux_total.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(2),'data_log/CwCL_flux_zoom1.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(3),'data_log/CwCL_flux_zoom2.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(4),'data_log/CwCL_alveolar_flux_zoom.pdf','BackgroundColor','none','ContentType','vector');

%% 

%% VOLUME
close all
figure;
for i=1:length(file_list)
plot(time_capacitance_CwCL{i},volume_capacitance_CwCL{i})
hold on
end
hold off
xlabel('t [s]')
ylabel('Volume [L]')
title('Volume by varying C_T')
legend(capacitance_CwCL,'Location','northeast')

x0=100;
y0=100;
width=1400;
height=400;
set(gcf,'position',[x0,y0,width,height])

exportgraphics(figure(1),'data_log/CwCL_volume_total.pdf','BackgroundColor','none','ContentType','vector');


figure;
for i=1:2:length(file_list)
plot(time_capacitance_CwCL{i},volume_capacitance_CwCL{i})
hold on
end
hold off
ylim([0, 1.5])
xlim([2,6])
legend(capacitance_CwCL{1:2:end})
xlabel('t [s]')
ylabel('Volume [L]')
title('Volume by varying C_T: zoom over 2^{nd} inspiratory peak')
exportgraphics(figure(2),'data_log/CwCL_volume_zoom.pdf','BackgroundColor','none','ContentType','vector');
%%
close all
figure;
plot(pressure_capacitance_CwCL{2}(1:2*end/5),volume_capacitance_CwCL{2}(1:2*end/5))
hold on
plot(pressure_capacitance_CwCL{5}(1:2*end/5),volume_capacitance_CwCL{5}(1:2*end/5))
plot(pressure_capacitance_CwCL{11}(1:2*end/5),volume_capacitance_CwCL{11}(1:2*end/5))
legend(capacitance_CwCL{2},capacitance_CwCL{5},capacitance_CwCL{11})
xlim([0 30])
ylim([0,1.5])
ylabel('Volume [L]')
xlabel('Pressure [cmH_2O]')
text(1.5,max(volume_capacitance_CwCL{2}(1:2*end/5)),strcat(num2str(max(volume_capacitance_CwCL{2}(1:2*end/5)),2),' \rightarrow') )
text(1.5,max(volume_capacitance_CwCL{5}(1:2*end/5)),strcat(num2str(max(volume_capacitance_CwCL{5}(1:2*end/5)),2),' \rightarrow'))
text(1.5,max(volume_capacitance_CwCL{11}(1:2*end/5)),strcat(num2str(max(volume_capacitance_CwCL{11}(1:2*end/5)),2),' \rightarrow'))
%exportgraphics(figure(1),'data_log/CwCL_PV.pdf','BackgroundColor','none','ContentType','vector');


%% 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%% Cs

close all
clear all
stringInit_1='data_Rc_1_Rp_0.5_Cs_';
stringInit_2='_Cw_0.02_CL_0.02.mat';

file_list= dir(strcat('data_log/*',stringInit_1,'*',stringInit_2));

filename='';
for i=1:length(file_list)
filename{i}=file_list(i).name;
filepath=strcat('data_log/',filename{i});
load(filepath)
capacitance_Cs(i)=erase(filename(i),stringInit_1);
capacitance_Cs(i)=erase(capacitance_Cs(i),stringInit_2);
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one
mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2); 
noise_point=find(mechanics_lung.Data(:,4)==min(mechanics_lung.Data(:,4)));
mechanics_lung.Data(noise_point,4)=mechanics_lung.Data(noise_point-1,4); 
pressure_capacitance_Cs{i}=mechanics_lung.Data(:,1);
% total flow from ventilator
flux_capacitance_Cs{i}=mechanics_lung.Data(:,2);
% flux on alveolar branch
flux_alveolar_capacitance_Cs{i}=mechanics_lung.Data(:,4);
volume_capacitance_Cs{i}=mechanics_lung.Data(:,3);
time_capacitance_Cs{i}=mechanics_lung.Time;
capacitance_Cs_value(i)=str2num(capacitance_Cs{i});
capacitance_Cs(i)=strcat('C_s=',capacitance_Cs(i),' [L/cmH2O]');
clear mechanics_lung
end
%% FLUX
close all
figure;
for i=1:length(file_list)
plot(time_capacitance_Cs{i},flux_capacitance_Cs{i}-flux_alveolar_capacitance_Cs{i})
hold on
flow_differential(i)=norm(flux_capacitance_Cs{i}-flux_alveolar_capacitance_Cs{i})/max(flux_capacitance_Cs{i}-flux_alveolar_capacitance_Cs{i});
end

hold off
xlabel('t [s]')
ylabel('Flux [L/s]')
title('Flux over shunt by varying Cs')
legend(capacitance_Cs,'Location','southeast')
ylim([-6, 2])

for i=1:length(file_list)-1
flow_diff(i)=mean(flux_capacitance_Cs{i}-flux_capacitance_Cs{i+1});
end
disp(mean(flow_diff))

x0=100;
y0=100;
width=1000;
height=450;
set(gcf,'position',[x0,y0,width,height])

figure;
plot(capacitance_Cs_value,flow_differential,'-*')
xlabel('C_s [L/cmH2O]')
ylabel('\Delta Flux')
title('Normalized difference between total flow and alveolar flow')
exportgraphics(figure(1),'data_log/Cs_fluxCS.pdf','BackgroundColor','none','ContentType','vector');
exportgraphics(figure(2),'data_log/CwCL_deltaflux.pdf','BackgroundColor','none','ContentType','vector');


