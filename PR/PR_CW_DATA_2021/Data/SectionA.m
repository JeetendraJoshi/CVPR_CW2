clear all
close all


%Use the plot command to view the time series sensor data for the variables Pressure, Vibration
%and Temperature (PVT) and the Electrodes. Do this for several objects and trials and then
%choose a single time step that looks like it will allow differentiation between the data for
%different objects. Explain why you chose that value. Include an example of your data
%visualisation for one or two object trials in your report. 
t = linspace(1, 1000, 1000);

%Objects Picked: Black Foam, Steel Vase and Car Sponge
%Trials Picked: Trials 1, 3 and 9




%% Black Foam
figure;
%% Trial 1
load("black_foam_110_01_HOLD.mat")


subplot(4,3,1);plot(t, F0pac(2, :)); title("Trial 1 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,4);plot(t, F0pdc);title("Trial 1 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,7);plot(t, F0Electrodes);title("Trial 1 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,10);plot(t, F0tdc);title("Trial 1 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 3
load("black_foam_110_03_HOLD.mat")

subplot(4,3,2);plot(t, F0pac(2,:)); title("Trial 3 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,5);plot(t, F0pdc);title("Trial 3 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,8);plot(t, F0Electrodes);title("Trial 3 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,11);plot(t, F0tdc);title("Trial 3 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 9
load("black_foam_110_09_HOLD.mat")


subplot(4,3,3);plot(t, F0pac(2,:)); title("Trial 9 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,6);plot(t, F0pdc);title("Trial 9 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,9);plot(t, F0Electrodes);title("Trial 9 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,12);plot(t, F0tdc);title("Trial 9 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);


sgtitle('\fontsize{22} Black Foam');


%% Steel Vase

%% Trial 1
load("steel_vase_702_01_HOLD.mat")
figure;


subplot(4,3,1);plot(t, F0pac(2,:)); title("Trial 1 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,4);plot(t, F0pdc);title("Trial 1 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,7);plot(t, F0Electrodes);title("Trial 1 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,10);plot(t, F0tdc);title("Trial 1 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 3
load("steel_vase_702_03_HOLD.mat")



subplot(4,3,2);plot(t, F0pac(2,:)); title("Trial 3 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,5);plot(t, F0pdc);title("Trial 3 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,8);plot(t, F0Electrodes);title("Trial 3 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,11);plot(t, F0tdc);title("Trial 3 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 9
load("steel_vase_702_09_HOLD.mat")


subplot(4,3,3);plot(t, F0pac(2,:)); title("Trial 9 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,6);plot(t, F0pdc);title("Trial 9 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,9);plot(t, F0Electrodes);title("Trial 9 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,12);plot(t, F0tdc);title("Trial 9 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);


sgtitle('\fontsize{22} Steel Vase');

%% Car Sponge Vase

%% Trial 1
load("car_sponge_101_01_HOLD.mat")
figure;


subplot(4,3,1);plot(t, F0pac(2,:)); title("Trial 1 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,4);plot(t, F0pdc);title("Trial 1 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,7);plot(t, F0Electrodes);title("Trial 1 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,10);plot(t, F0tdc);title("Trial 1 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 3
load("car_sponge_101_03_HOLD.mat")


subplot(4,3,2);plot(t, F0pac(2,:)); title("Trial 3 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,5);plot(t, F0pdc);title("Trial 3 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,8);plot(t, F0Electrodes);title("Trial 3 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,11);plot(t, F0tdc);title("Trial 3 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 9
load("car_sponge_101_09_HOLD.mat")


subplot(4,3,3);plot(t, F0pac(2,:)); title("Trial 9 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,6);plot(t, F0pdc);title("Trial 9 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,9);plot(t, F0Electrodes);title("Trial 9 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,12);plot(t, F0tdc);title("Trial 9 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);


sgtitle('\fontsize{22} Car Sponge');




%For one finger (F0 or F1), sample the Pressure, Vibration, Temperature time series data into
%scaler values measured at the time instance (of your selected time step) for each object / trial.
%Save the data structures together as a .mat file called F0_PVT.mat or F1_PVT.mat. Repeat for
%the Electrodes data, saving that as another .mat file. Note that all subsequent actions in this
%coursework will be on the data sets you just created (and therefore only on one of the robot%s
%fingers).

t = 32;


data = dir('*.mat');

PVT = zeros(60,3);




for i = 1:length(data)
dataname = data(i).name;

load(dataname);
    PVT(i,1) = F0pdc(1,t);
    PVT(i,2) = F0pac(2,t);
    PVT(i,3) = F0tdc(1,t);

 
end


save('F0_PVT.mat', 'PVT');
ElectrodesData = zeros(60, 19);

for i = 1:length(data)
    load(data(i).name);
    ElectrodesData(i, :) = F0Electrodes(:, t);
end

save('F0Electrodes.mat',"ElectrodesData");



%Create a 3D scatter plot of the complete contents of the PVT mat file, with the axis as Pressure,
%Vibration and Temperature, with different colours used for different objects. Use the same
%colours for the objects throughout this work.

% Loads in the Data
load("F0_PVT.mat")

%X Axis is Pressure, Y axis is Vibration and Z Axis is Temperature
sampledDataPressure = squeeze(PVT(:, 1, :)); 
sampledDataVibration = squeeze(PVT(:, 2, :)); 
sampledDataTemperature = squeeze(PVT(:, 3, :));

% Ensures data can be plotted correctly for the 60 trials
p = reshape(sampledDataPressure', [1, 60]);
v = reshape(sampledDataVibration', [1, 60]);
t = reshape(sampledDataTemperature', [1, 60]);

colors = ['r', 'g', 'b', 'm', 'k', 'c'];
% Red - Acrylic
% Green - Black Foam
% Blue - Car Sponge
% Magenta - Flour Sack
% Black - Kitchen Sponge
% Cyan - Steel Vase
n=0;

figure;
for i=1:10:60
    n=n+1;
    color = colors(n);
    scatter3(p(1, i:(i+9)),v(1,i:(i+9)),t(1, i:(i+9)),15,'filled',color); grid on; hold on;
end

xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');
title('3D PVT scatter plot')
legend('Acrylic','Black Foam','Car Sponge', 'Flour Sack', 'Kitchen Sponge','Steel Vase')

