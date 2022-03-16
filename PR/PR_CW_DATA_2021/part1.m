
close all
downsamplefactor = 25;
t = linspace(1, 1000, 1000/downsamplefactor);





%% Black Foam
figure;
%% Trial 1
load("Data\black_foam_110_01_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);
newElectrodes = [];
electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,1);plot(t, F0pac); title("Trial 1 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,4);plot(t, F0pdc);title("Trial 1 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,7);plot(t, newElectrodes);title("Trial 1 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,10);plot(t, F0tdc);title("Trial 1 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 3
load("Data\black_foam_110_03_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,2);plot(t, F0pac); title("Trial 3 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,5);plot(t, F0pdc);title("Trial 3 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,8);plot(t, newElectrodes);title("Trial 3 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,11);plot(t, F0tdc);title("Trial 3 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 9
load("Data\black_foam_110_09_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,3);plot(t, F0pac); title("Trial 9 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,6);plot(t, F0pdc);title("Trial 9 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,9);plot(t, newElectrodes);title("Trial 9 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,12);plot(t, F0tdc);title("Trial 9 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);


sgtitle('\fontsize{22} Black Foam');


%% Steel Vase

%% Trial 1
load("Data\steel_vase_702_01_HOLD.mat")
figure;
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,1);plot(t, F0pac); title("Trial 1 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,4);plot(t, F0pdc);title("Trial 1 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,7);plot(t, newElectrodes);title("Trial 1 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,10);plot(t, F0tdc);title("Trial 1 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 3
load("Data\steel_vase_702_03_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,2);plot(t, F0pac); title("Trial 3 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,5);plot(t, F0pdc);title("Trial 3 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,8);plot(t, newElectrodes);title("Trial 3 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,11);plot(t, F0tdc);title("Trial 3 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 9
load("Data\steel_vase_702_09_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,3);plot(t, F0pac); title("Trial 9 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,6);plot(t, F0pdc);title("Trial 9 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,9);plot(t, newElectrodes);title("Trial 9 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,12);plot(t, F0tdc);title("Trial 9 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);


sgtitle('\fontsize{22} Steel Vase');

%% Car Sponge Vase

%% Trial 1
load("Data\car_sponge_101_01_HOLD.mat")
figure;
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,1);plot(t, F0pac); title("Trial 1 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,4);plot(t, F0pdc);title("Trial 1 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,7);plot(t, newElectrodes);title("Trial 1 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,10);plot(t, F0tdc);title("Trial 1 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 3
load("Data\car_sponge_101_03_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,2);plot(t, F0pac); title("Trial 3 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,5);plot(t, F0pdc);title("Trial 3 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,8);plot(t, newElectrodes);title("Trial 3 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,11);plot(t, F0tdc);title("Trial 3 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);

%% Trial 9
load("Data\car_sponge_101_09_HOLD.mat")
F0pac = downsample(F0pac(2,:), downsamplefactor);
F0pdc = downsample(F0pdc , downsamplefactor);

electrodescolumns = size(F0Electrodes);
for c = 1:electrodescolumns(1)
    newElectrodes(c,:) = downsample(F0Electrodes(c,:), downsamplefactor);
end

F0tdc = downsample(F0tdc, downsamplefactor);

subplot(4,3,3);plot(t, F0pac); title("Trial 9 - Finger 0 Vibration"); set(gca, 'FontSize', 6);
subplot(4,3,6);plot(t, F0pdc);title("Trial 9 - Finger 0 Pressure"); set(gca, 'FontSize', 6);
subplot(4,3,9);plot(t, newElectrodes);title("Trial 9 - Finger 0 Electrodes"); set(gca, 'FontSize', 6);
subplot(4,3,12);plot(t, F0tdc);title("Trial 9 - Finger 0 Core Temperature"); set(gca, 'FontSize', 6);


sgtitle('\fontsize{22} Car Sponge');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PART 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 50;


data = dir('C:/Users/jzlol/Documents/CVPR/PR/PR_CW_DATA_2021/Data/*.mat');

PVT = zeros(60,3);


spec_case = 1000 /downsamplefactor; 

for i = 1:length(data)
load(data(i).name);
data(i).name

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PART
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load("F0_PVT.mat")

%X axis will be pressure, y axis will be vibration and z axis will be
%temperature
sampledDataPressure = squeeze(PVT(:, 1, :)); 
sampledDataVibration = squeeze(PVT(:, 2, :)); 
sampledDataTemperature = squeeze(PVT(:, 3, :));


p = reshape(sampledDataPressure', [1, 60]);
v = reshape(sampledDataVibration', [1, 60]);
t = reshape(sampledDataTemperature', [1, 60]);

colors = ['r', 'g', 'b', 'm', 'k', 'c'];
n=0;

figure;
for i=1:10:60
    n=n+1;
    color = colors(n);
    scatter3(p(1, i:(i+9)),v(1,i:(i+9)),t(1, i:(i+9)),15,'filled',color); grid on; hold on;
end

xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');
title('3D PVT scatter plot - Perspective 1')
legend('acrylic','black foam','car sponge', 'flour sack', 'kitchen sponge','steel vase')

