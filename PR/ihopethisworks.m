acrylic_1 = load('PR_CW_DATA_2021/acrylic_211_01_HOLD.mat');

black_foam_1 = load('PR_CW_DATA_2021/black_foam_110_01_HOLD.mat');

car_sponge_1 = load('PR_CW_DATA_2021/car_sponge_101_01_HOLD.mat');

flour_sack_1 = load('PR_CW_DATA_2021/flour_sack_410_01_HOLD.mat');

kitchen_sponge_1 = load('PR_CW_DATA_2021/kitchen_sponge_114_01_HOLD.mat');

steel_vase_1 = load('PR_CW_DATA_2021/steel_vase_702_01_HOLD.mat');

% Use the plot command to view the time series sensor data for the variables

% Pressure, Vibration and Temperature (PVT) and the Electrodes

pressure = acrylic_1.F0pdc;

vibration = acrylic_1.F0pac;

temperature = acrylic_1.F0tdc;

electrodes = acrylic_1.F0Electrodes(3,:);

% Do this for several objects and trials and then choose a single time step that

% looks like it will allow differentiation between the data for different objects.

sum = 0;

step = [4, 5, 8, 10, 20, 25, 40, 50, 100, 125, 200, 400, 500];

results = [];

for k = 1:13

for i=1:19

acrylic = downsample(acrylic_1.F0Electrodes(i,:), step(k));

black = downsample(black_foam_1.F0Electrodes(i,:), step(k));

car = downsample(car_sponge_1.F0pdc, step(k));

flour = downsample(flour_sack_1.F0pdc, step(k));

kitchen = downsample(kitchen_sponge_1.F0Electrodes(i,:), step(k));

steel = downsample(steel_vase_1.F0Electrodes(i,:), step(k));

arr = [];

for j=1:1000/step(k)

arr(j) = norm(car(j) - flour(j));

end

[M,I] = max(arr);

sum = sum + M;

end

disp("Step size " + step(k) + " : " + sum/19);

results(k) = sum/19;

end

plot(step, results);