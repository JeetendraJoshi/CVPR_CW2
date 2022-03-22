clear all
close all




load("F0_PVT.mat")

%Use LDA to split the training data in terms of Pressure vs. Vibration, Pressure vs.
%Temperature and Temperature vs. Vibration. Plot the results, including a line showing
%the generated LDA function. 


% Extract Specifically the blackFoam and  carSponge Data
% Change the indexes within the data set to get the correct range


bothClasses = PVT(11:30, 1:3);

% Each class is normalised within the entire dataset
normalisedBothClasses = normalize(bothClasses);


%The according data is extracted per class
normalisedBF = normalisedBothClasses(1:10, 1:3);
normalisedCS = normalisedBothClasses(11:20, 1:3);



%Now apply LDA to the three-dimensional PVT data
% Mean of Each Class is Computed
blackFoamMean = mean(normalisedBF);
carSpongeMean = mean(normalisedCS);


% Data is partitioned to become two dimensional per parameter
BF_PV = [normalisedBF(:, 1), normalisedBF(:, 2)];
BF_VT = [normalisedBF(:, 3), normalisedBF(:, 2)];
BF_PT = [normalisedBF(:, 1), normalisedBF(:, 3)];
CS_PV = [normalisedCS(:, 1), normalisedCS(:, 2)];
CS_VT = [normalisedCS(:, 3), normalisedCS(:, 2)];
CS_PT = [normalisedCS(:, 1), normalisedCS(:, 3)];


% Mean is extracted accordingly similar to the previous data partition
BF_PV_Means = [blackFoamMean(1), blackFoamMean(2)];
BF_VT_Means = [blackFoamMean(3), blackFoamMean(2)];
BF_PT_Means = [blackFoamMean(1), blackFoamMean(3)];
CS_PV_Means = [carSpongeMean(1), carSpongeMean(2)];
CS_VT_Means = [carSpongeMean(3), carSpongeMean(2)];
CS_PT_Means = [carSpongeMean(1), carSpongeMean(3)];


%Within Class Scatter Matrix Computed
scatterBF_PV_WC = transpose(BF_PV - BF_PV_Means)* (BF_PV - BF_PV_Means);
scatterBF_VT_WC = transpose(BF_VT - BF_VT_Means)* (BF_VT - BF_VT_Means);
scatterBF_PT_WC = transpose(BF_PT - BF_PT_Means)* (BF_PT - BF_PT_Means);

scatterCS_PV_WC = transpose(CS_PV - CS_PV_Means)* (CS_PV - CS_PV_Means);
scatterCS_VT_WC = transpose(CS_VT - CS_VT_Means)* (CS_VT - CS_VT_Means);
scatterCS_PT_WC = transpose(CS_PT - CS_PT_Means)* (CS_PT - CS_PT_Means);

totalScatterPV_WC = scatterBF_PV_WC + scatterCS_PV_WC;
totalScatterVT_WC = scatterBF_VT_WC + scatterCS_VT_WC;
totalScatterPT_WC = scatterBF_PT_WC + scatterCS_PT_WC;

%Between Class Scatter Matrix Computed
scatter_PV_BC = transpose(BF_PV_Means - CS_PV_Means) * (BF_PV_Means - CS_PV_Means);
scatter_VT_BC = transpose(BF_VT_Means - CS_VT_Means) * (BF_VT_Means - CS_VT_Means);
scatter_PT_BC = transpose(BF_PT_Means - CS_PT_Means) * (BF_PT_Means - CS_PT_Means);

%Top 2 Eigenvectors and Eigenvalues per data array 
[PVeigenVectors, PVeigenValues] = eigs(totalScatterPV_WC\scatter_PV_BC, 2);
[VTeigenVectors, VTeigenValues] = eigs(totalScatterVT_WC\scatter_VT_BC, 2);
[PTeigenVectors, PTeigenValues] = eigs(totalScatterPT_WC\scatter_PT_BC, 2);


% Extract the top eigen vector to project on to
LDPV = PVeigenVectors(:, 1);
LDVT = VTeigenVectors(:, 1);
LDPT = PTeigenVectors(:, 1);




%Plotting of all graphs and projections on to 1D axes

figure;
scatter(normalisedCS(:, 2),normalisedCS(:, 1), "b"); % Pressure vs Vibration
hold on
scatter(normalisedBF(:, 2),normalisedBF(:, 1), "g");
hold on
quiver(0,0, LDPV(1, 1), LDPV(2, 1))
hold on
title("Pressure vs Vibration");
xlabel("Pressure");
ylabel("Vibration");
legend("Car Sponge", "Black Foam");




figure;
scatter(normalisedCS(:, 2),normalisedCS(:, 3), "b"); % Vibration vs Temperature
hold on
scatter(normalisedBF(:, 2),normalisedBF(:, 3), "g");
hold on
quiver(0,0, LDVT(1, 1), LDVT(2, 1))
hold on
title("Vibration vs Temperature");
xlabel("Vibration");
ylabel("Temperature");
legend( "Car Sponge", "Black Foam");

figure;
scatter(normalisedCS(:, 3),normalisedCS(:, 1), "b"); % Pressure vs Temperature
hold on
scatter(normalisedBF(:, 3),normalisedBF(:, 1), "g");
hold on
quiver(0,0, LDPT(1, 1), LDPT(2, 1))
hold on
title("Pressure vs Temperature");
xlabel("Pressure");
ylabel("Temperature");
legend("Car Sponge", "Black Foam");

screeBFPV = BF_PV* LDPV;
screeCSPV = CS_PV * LDPV;
screePlotPV = [screeCSPV; screeBFPV];
yvalue = zeros(10,1);

figure

plot(screePlotPV(1:10), yvalue,"o", "Color",  "b")
hold on

plot(screePlotPV(11:20), yvalue,"o", "Color",  "g")
title("Pressure Vibration LD Projection")
legend("Car Sponge", "Black Foam");
xlabel("LD")




figure
screeBFPT = BF_PT* LDPT;
screeCSPT = CS_PT * LDPT;
screePlotPT = [screeCSPT; screeBFPT];


plot(screePlotPT(1:10), yvalue,"o", "Color", "b")
hold on
plot(screePlotPT(11:20), yvalue,"o", "Color", "g")
title("Pressure Temperature LD Projection")
legend("Car Sponge", "Black Foam");
xlabel("LD")

figure
screeBFVT = BF_VT* LDVT;
screeCSVT = CS_VT * LDVT;
screePlotVT = [screeCSVT; screeBFVT];

yvalue = zeros(10,1);
plot(screePlotVT(1:10), yvalue,"o", "Color", "b")
hold on
plot(screePlotVT(11:20), yvalue,"o", "Color",  "g")
hold on
title("Vibration Temperature LD Projection")
legend("Car Sponge", "Black Foam");
xlabel("LD")



%Repeat the LDA analysis with your own choice of two objects. Explain why you have
%selected those objects for analysis. In other words – what were you trying to test and
%what did you determine?




% Extract Specifically the kitchenSponge and  carSponge Data
% Change the indexes within the data set to get the correct range

%Names of all variables are the same to make it easier for the programming
%side so only index notation needs to change
bothClasses = [PVT(41:50, 1:3);PVT(21:30, 1:3)];

% Each class is normalised within the entire dataset
normalisedBothClasses = normalize(bothClasses);


%The according data is extracted per class
normalisedBF = normalisedBothClasses(1:10, 1:3);
normalisedCS = normalisedBothClasses(11:20, 1:3);



%Now apply LDA to the three-dimensional PVT data
% Mean of Each Class is Computed
blackFoamMean = mean(normalisedBF);
carSpongeMean = mean(normalisedCS);


% Data is partitioned to become two dimensional per parameter
BF_PV = [normalisedBF(:, 1), normalisedBF(:, 2)];
BF_VT = [normalisedBF(:, 3), normalisedBF(:, 2)];
BF_PT = [normalisedBF(:, 1), normalisedBF(:, 3)];
CS_PV = [normalisedCS(:, 1), normalisedCS(:, 2)];
CS_VT = [normalisedCS(:, 3), normalisedCS(:, 2)];
CS_PT = [normalisedCS(:, 1), normalisedCS(:, 3)];


% Mean is extracted accordingly similar to the previous data partition
BF_PV_Means = [blackFoamMean(1), blackFoamMean(2)];
BF_VT_Means = [blackFoamMean(3), blackFoamMean(2)];
BF_PT_Means = [blackFoamMean(1), blackFoamMean(3)];
CS_PV_Means = [carSpongeMean(1), carSpongeMean(2)];
CS_VT_Means = [carSpongeMean(3), carSpongeMean(2)];
CS_PT_Means = [carSpongeMean(1), carSpongeMean(3)];


%Within Class Scatter Matrix Computed
scatterBF_PV_WC = transpose(BF_PV - BF_PV_Means)* (BF_PV - BF_PV_Means);
scatterBF_VT_WC = transpose(BF_VT - BF_VT_Means)* (BF_VT - BF_VT_Means);
scatterBF_PT_WC = transpose(BF_PT - BF_PT_Means)* (BF_PT - BF_PT_Means);

scatterCS_PV_WC = transpose(CS_PV - CS_PV_Means)* (CS_PV - CS_PV_Means);
scatterCS_VT_WC = transpose(CS_VT - CS_VT_Means)* (CS_VT - CS_VT_Means);
scatterCS_PT_WC = transpose(CS_PT - CS_PT_Means)* (CS_PT - CS_PT_Means);

totalScatterPV_WC = scatterBF_PV_WC + scatterCS_PV_WC;
totalScatterVT_WC = scatterBF_VT_WC + scatterCS_VT_WC;
totalScatterPT_WC = scatterBF_PT_WC + scatterCS_PT_WC;

%Between Class Scatter Matrix Computed
scatter_PV_BC = transpose(BF_PV_Means - CS_PV_Means) * (BF_PV_Means - CS_PV_Means);
scatter_VT_BC = transpose(BF_VT_Means - CS_VT_Means) * (BF_VT_Means - CS_VT_Means);
scatter_PT_BC = transpose(BF_PT_Means - CS_PT_Means) * (BF_PT_Means - CS_PT_Means);

%Top 2 Eigenvectors and Eigenvalues per data array 
[PVeigenVectors, PVeigenValues] = eigs(totalScatterPV_WC\scatter_PV_BC, 2);
[VTeigenVectors, VTeigenValues] = eigs(totalScatterVT_WC\scatter_VT_BC, 2);
[PTeigenVectors, PTeigenValues] = eigs(totalScatterPT_WC\scatter_PT_BC, 2);


% Extract the top eigen vector to project on to
LDPV = PVeigenVectors(:, 1);
LDVT = VTeigenVectors(:, 1);
LDPT = PTeigenVectors(:, 1);




%Plotting of all graphs and projections on to 1D axes

figure;
scatter(normalisedCS(:, 2),normalisedCS(:, 1), "b"); % Pressure vs Vibration
hold on
scatter(normalisedBF(:, 2),normalisedBF(:, 1), "k");
hold on
quiver(0,0, LDPV(1, 1), LDPV(2, 1))
hold on
title("Pressure vs Vibration");
xlabel("Pressure");
ylabel("Vibration");
legend("Car Sponge", "Kitchen Sponge");




figure;
scatter(normalisedCS(:, 2),normalisedCS(:, 3), "b"); % Vibration vs Temperature
hold on
scatter(normalisedBF(:, 2),normalisedBF(:, 3), "k");
hold on
quiver(0,0, LDVT(1, 1), LDVT(2, 1))
hold on
title("Vibration vs Temperature");
xlabel("Vibration");
ylabel("Temperature");
legend("Car Sponge", "Kitchen Sponge");

figure;
scatter(normalisedCS(:, 3),normalisedCS(:, 1), "b"); % Pressure vs Temperature
hold on
scatter(normalisedBF(:, 3),normalisedBF(:, 1), "k");
hold on
quiver(0,0, LDPT(1, 1), LDPT(2, 1))
hold on
title("Pressure vs Temperature");
xlabel("Pressure");
ylabel("Temperature");
legend("Car Sponge", "Kitchen Sponge");

screeBFPV = BF_PV* LDPV;
screeCSPV = CS_PV * LDPV;
screePlotPV = [screeCSPV; screeBFPV];
yvalue = zeros(10,1);

figure

plot(screePlotPV(1:10), yvalue,"o", "Color",  "b")
hold on

plot(screePlotPV(11:20), yvalue,"o", "Color",  "k")
title("Pressure Vibration LD Projection")
legend("Car Sponge", "Kitchen Sponge");
xlabel("LD")




figure
screeBFPT = BF_PT* LDPT;
screeCSPT = CS_PT * LDPT;
screePlotPT = [screeCSPT; screeBFPT];


plot(screePlotPT(1:10), yvalue,"o", "Color", "b")
hold on
plot(screePlotPT(11:20), yvalue,"o", "Color", "k")
title("Pressure Temperature LD Projection")
legend("Car Sponge", "Kitchen Sponge");
xlabel("LD")

figure
screeBFVT = BF_VT* LDVT;
screeCSVT = CS_VT * LDVT;
screePlotVT = [screeCSVT; screeBFVT];

yvalue = zeros(10,1);
plot(screePlotVT(1:10), yvalue,"o", "Color", "b")
hold on
plot(screePlotVT(11:20), yvalue,"o", "Color",  "k")
hold on
title("Vibration Temperature LD Projection")
legend("Car Sponge", "Kitchen Sponge");
xlabel("LD")


%close all