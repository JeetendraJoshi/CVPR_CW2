load("F0_PVT.mat")


%%%%%%%%%%%PART 1 a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Normalised = zscore(PVT);

covarianceMat = cov(Normalised);

[eigenVectors,eigenValues]  = eig(covarianceMat);



featureVector = fliplr(eigenVectors);



%%%%%%%%%%%%%%%%% PART 1 b %%%%%%%%%%%%%%%%%%%%%


[coeff,score] = pca(Normalised);
colors = ['r', 'g', 'b', 'm', 'k', 'c'];
n=0;
figure;

% Data Points
for i=1:10:60
    n=n+1;
    color = colors(n);
    scatter3(Normalised(i:(i+9),1),Normalised(i:(i+9),2),Normalised(i:(i+9),3),30,'filled',color); grid on; hold on;
end
xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');

% PC vectors
for i=1:3
    quiver3(0, featureVector(i,1), featureVector(i,2), featureVector(i,3),2,'Linewidth',3); hold on;
end

legend('acrylic','black foam','car sponge', 'flour sack', 'kitchen sponge','steel vase', 'PC 1','PC 2','PC 3')
set(findall(gca, 'Type', 'Line'),'LineWidth',3);
set(gca,'Fontsize',22)
title('Standardised data with PC')

%%%%%%%%%%%%%%%%%%%%%%% PART 1 c %%%%%%%%%%%%%%%%



