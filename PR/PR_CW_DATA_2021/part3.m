close all
load("F0_PVT.mat")

bothClasses = PVT(11:30, 1:3);
blackFoamData = PVT(11:20, 1:3);
carSpongeData = PVT(21:30, 1:3);

normalisedBF = normalize(blackFoamData);
normalisedCS = normalize(carSpongeData);
normalisedBothClasses = normalize(bothClasses);

figure;
scatter(normalisedCS(1:10, 1),normalisedCS(1:10, 2), "red"); % Pressure vs Volume
hold on
scatter(normalisedBF(1:10, 1),normalisedBF(1:10, 2), "blue");

figure;
scatter(normalisedCS(1:10, 2),normalisedCS(1:10, 3), "red"); % Volume vs Temperature
hold on
scatter(normalisedBF(1:10, 2),normalisedBF(1:10, 3), "blue");

figure;
scatter(normalisedCS(1:10, 1),normalisedCS(1:10, 3), "red"); % Pressure vs Temperature
hold on
scatter(normalisedBF(1:10, 1),normalisedBF(1:10, 3), "blue");



blackFoamMean = mean(blackFoamData);
carSpongeMean = mean(carSpongeData);
totalMean = mean(bothClasses);


BF_PV = [normalisedBF(:, 1), normalisedBF(:, 2)];
BF_VT = [normalisedCS(:, 2), normalisedBF(:, 3)];
BF_PT = [normalisedBF(:, 1), normalisedBF(:, 3)];
CS_PV = [normalisedBF(:, 1), normalisedBF(:, 2)];
CS_VT = [normalisedBF(:, 2), normalisedBF(:, 3)];
CS_PT = [normalisedBF(:, 1), normalisedBF(:, 3)];


BF_PV_Means = [blackFoamMean(1), blackFoamMean(2)];
BF_VT_Means = [blackFoamMean(2), blackFoamMean(3)];
BF_PT_Means = [blackFoamMean(1), blackFoamMean(3)];
CS_PV_Means = [carSpongeMean(1), carSpongeMean(2)];
CS_VT_Means = [carSpongeMean(2), carSpongeMean(3)];
CS_PT_Means = [carSpongeMean(1), carSpongeMean(3)];


scatterBF_PV_WC = transpose(BF_PV - BF_PV_Means)* (BF_PV - BF_PV_Means);
scatterBF_VT_WC = transpose(BF_VT - BF_VT_Means)* (BF_VT - BF_VT_Means);
scatterBF_PT_WC = transpose(BF_PT - BF_PT_Means)* (BF_PT - BF_PT_Means);

scatterCS_PV_WC = transpose(CS_PV - CS_PV_Means)* (CS_PV - CS_PV_Means);
scatterCS_VT_WC = transpose(CS_VT - CS_VT_Means)* (CS_VT - CS_VT_Means);
scatterCS_PT_WC = transpose(CS_PT - CS_PT_Means)* (CS_PT - CS_PT_Means);

totalScatterPV_WC = scatterBF_PV_WC + scatterCS_PV_WC;
totalScatterVT_WC = scatterBF_VT_WC + scatterCS_VT_WC;
totalScatterPT_WC = scatterBF_PT_WC + scatterCS_PT_WC;

scatter_PV_BC = transpose(BF_PV_Means - CS_PV_Means) * (BF_PV_Means - CS_PV_Means);
scatter_VT_BC = transpose(BF_VT_Means - CS_VT_Means) * (BF_VT_Means - CS_VT_Means);
scatter_PT_BC = transpose(BF_PT_Means - CS_PT_Means) * (BF_PT_Means - CS_PT_Means);


[PVeigenVectors, PVeigenValues] = eig(totalScatterPV_WC\scatter_PV_BC);
[VTeigenVectors, VTeigenValues] = eig(totalScatterVT_WC\scatter_VT_BC);
[PTeigenVectors, PTeigenValues] = eig(totalScatterPT_WC\scatter_PT_BC);









close all