load lung_mech_extended_data_export.mat
%%
% data clear 
noise_point=find(mechanics_lung.Data(:,2)==min(mechanics_lung.Data(:,2)));
% replace extremely noise point with the previous one

mechanics_lung.Data(noise_point,2)=mechanics_lung.Data(noise_point-1,2); 
figure()
plot(mechanics_lung.Time,mechanics_lung.Data(:,1))
hold on
for i=2:length(mechanics_lung.Data(1,:))
    plot(mechanics_lung.Time,mechanics_lung.Data(:,i))
end
hold off
legend({'Input waveform', 'Flux', 'Volume'},'Location','southeast')
xlabel('t[s]')
title('Input vs flow and volume')
yyaxis left
ylim([-25;30])
ylabel('Input [cmH2O]')
yyaxis right
ylim([-25;30])
ylabel('Flux [cmH2O/s] CONTROLLA')
