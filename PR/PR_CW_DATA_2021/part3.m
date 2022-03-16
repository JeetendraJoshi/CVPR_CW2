close all




load("F0_PVT.mat")



bothClasses = PVT(11:30, 1:3);
normalisedBothClasses = normalize(bothClasses);

normalisedBF = normalisedBothClasses(1:10, 1:3);
normalisedCS = normalisedBothClasses(11:20, 1:3);

blackFoamMean = mean(normalisedBF);
carSpongeMean = mean(normalisedCS);



BF_PV = [normalisedBF(:, 1), normalisedBF(:, 2)];
BF_VT = [normalisedBF(:, 3), normalisedBF(:, 2)];
BF_PT = [normalisedBF(:, 1), normalisedBF(:, 3)];
CS_PV = [normalisedCS(:, 1), normalisedCS(:, 2)];
CS_VT = [normalisedCS(:, 3), normalisedCS(:, 2)];
CS_PT = [normalisedCS(:, 1), normalisedCS(:, 3)];


BF_PV_Means = [blackFoamMean(1), blackFoamMean(2)];
BF_VT_Means = [blackFoamMean(3), blackFoamMean(2)];
BF_PT_Means = [blackFoamMean(1), blackFoamMean(3)];
CS_PV_Means = [carSpongeMean(1), carSpongeMean(2)];
CS_VT_Means = [carSpongeMean(3), carSpongeMean(2)];
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


[PVeigenVectors, PVeigenValues] = eigs(totalScatterPV_WC\scatter_PV_BC, 2);
[VTeigenVectors, VTeigenValues] = eigs(totalScatterVT_WC\scatter_VT_BC, 2);
[PTeigenVectors, PTeigenValues] = eigs(totalScatterPT_WC\scatter_PT_BC, 2);

LDPV = PVeigenVectors(:, 1);
LDVT = VTeigenVectors(:, 1);
LDPT = PTeigenVectors(:, 1);


figure;
scatter(normalisedCS(:, 2),normalisedCS(:, 1), "red"); % Pressure vs Vibration
hold on
scatter(normalisedBF(:, 2),normalisedBF(:, 1), "blue");
hold on
quiver(0,0, LDPV(1, 1), LDPV(2, 1))
hold on
title("Pressure vs Vibration");
xlabel("Pressure");
ylabel("Vibration");
legend("Car Sponge", "Black Foam");




figure;
scatter(normalisedCS(:, 2),normalisedCS(:, 3), "red"); % Volume vs Temperature
hold on
scatter(normalisedBF(:, 2),normalisedBF(:, 3), "blue");
hold on
quiver(0,0, LDVT(1, 1), LDVT(2, 1))
hold on
title("Vibration vs Temperature");
xlabel("Vibration");
ylabel("Temperature");
legend("Car Sponge", "Black Foam");

figure;
scatter(normalisedCS(:, 3),normalisedCS(:, 1), "red"); % Pressure vs Temperature
hold on
scatter(normalisedBF(:, 3),normalisedBF(:, 1), "blue");
hold on
quiver(0,0, LDPT(1, 1), LDPT(2, 1))
hold on
title("Pressure vs Temeprature");
xlabel("Pressure");
ylabel("Temperature");
legend("Car Sponge", "Black Foam");




figure
scatter(normalisedCS(:, 2), ones(10), "green")
hold on
scatter(normalisedBF(:, 2), ones(10), "red");






%close all