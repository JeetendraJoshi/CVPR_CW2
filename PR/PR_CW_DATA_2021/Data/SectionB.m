close all
load("F0_PVT.mat")
%Part 1 Section B

%a)
%Report Covariance matrix, eigen values, eigenvectors for the data

%Covariance matrix 
% - Combine struct to a single 3x60 matrix (TVP x all 10 trials on all 6
% objects)
% - Standardise (Subtract mean and divide by standard deviation)
% - Find covariance of the 3x60 matrix
concatenated_matrix = PVT';

matrix_mean = mean(concatenated_matrix, 2);
matrix_st = std(concatenated_matrix.');
concatenated_matrix = concatenated_matrix - matrix_mean;

concatenated_matrix(1, :) = concatenated_matrix(1, :) ./ matrix_st(1);
concatenated_matrix(2, :) = concatenated_matrix(2, :) ./ matrix_st(2);
concatenated_matrix(3, :) = concatenated_matrix(3, :) ./ matrix_st(3);

matrix_covariance = cov(concatenated_matrix.');
[matrix_eig_vects, matrix_eig_vals] = eig(matrix_covariance);

%b)
%Replot the standardised data with principal components displayed.

%Plotting standardised matrix
x = concatenated_matrix(1, :);
y = concatenated_matrix(2, :);
z = concatenated_matrix(3, :);

figure;
scatter3(x,y, z);
hold on

%Displaying eigen vectors
x = [ matrix_eig_vects(1, 1), matrix_eig_vects(2, 1), matrix_eig_vects(3, 1)];
y = [ matrix_eig_vects(1, 2), matrix_eig_vects(2, 2), matrix_eig_vects(3, 2)];
z = [ matrix_eig_vects(1, 3), matrix_eig_vects(2, 3), matrix_eig_vects(3, 3)];

plot3([0,0,0; x], [0,0,0; y], [0,0,0; z]);
hold off

%c)
%Reduce the data to 2-dimensions and replot.

%two largest eigenvalues are column 2,3, choose those eigenvectors
%multiply this feature vector matrix with the original data

feature_vector = [matrix_eig_vects(:,2), matrix_eig_vects(:,3)]; 

two_d_plot = concatenated_matrix.' * feature_vector;
figure;
scatter(two_d_plot(:, 1), two_d_plot(:,2));

hold on

x = [matrix_eig_vects(2, 1), matrix_eig_vects(3, 1)];
y = [matrix_eig_vects(2, 2), matrix_eig_vects(3, 2)];

plot([0,0; x], [0,0; y]);

hold off

%d)
%Show how the data is distributed across all PCs by plotting as separate 1D
%number lines

pc_one = [two_d_plot(: , 1)];
pc_two = [two_d_plot(: , 2)];
figure;

nexttile
scatter(pc_one, 1, 'filled','r');
hold on;
nexttile
scatter(pc_two, 2, 'filled','g');



%Part 2 Section B

%a)
%Use PCA to determine the principal components of electrode data. Report on
%the variances with a Scree plot

load("F0Electrodes.mat");

normalisedElectrodes = normalize(ElectrodesData);

covMat = cov(normalisedElectrodes);

[covEigenVectorsFull, covEigenValuesFull] = eig(covMat);

screePlotY = flip(diag(covEigenValuesFull));


figure;
plot(1:19, screePlotY, '-o');
title("Scree Plot for Electrode Data")
xlabel("Electrodes")
ylabel("Eigenvalues")


[covEigenVectors, covEigenValues] = eigs(covMat, 3);

projectionPrincipalComponents = normalisedElectrodes *covEigenVectors;

acrylicPrincipalComponents = projectionPrincipalComponents(1:10, :);
blackFoamPrincipalComponents = projectionPrincipalComponents(11:20, :);
carSpongePrincipalComponents = projectionPrincipalComponents(21:30, :);
flourSackPrincipalComponents = projectionPrincipalComponents(31:40, :);
kitchenSpongePrincipalComponents = projectionPrincipalComponents(41:50, :);
steelVasePrincipalComponents = projectionPrincipalComponents(51:60, :);

color = ['r', 'g', 'b', 'm', 'k', 'c'];
figure;
plot3(acrylicPrincipalComponents(:,1),acrylicPrincipalComponents(:,2),acrylicPrincipalComponents(:,3),'*',"Color", color(1))
hold on
plot3(blackFoamPrincipalComponents(:,1),blackFoamPrincipalComponents(:,2),blackFoamPrincipalComponents(:,3), '*',"Color", color(2))
hold on
plot3(carSpongePrincipalComponents(:,1),carSpongePrincipalComponents(:,2),carSpongePrincipalComponents(:,3),'*', "Color", color(3))
hold on
plot3(flourSackPrincipalComponents(:,1),flourSackPrincipalComponents(:,2),flourSackPrincipalComponents(:,3),'*', "Color", color(4))
hold on
plot3(kitchenSpongePrincipalComponents(:,1),kitchenSpongePrincipalComponents(:,2),kitchenSpongePrincipalComponents(:,3),'*',"Color", color(5))
hold on
plot3(steelVasePrincipalComponents(:,1),steelVasePrincipalComponents(:,2),steelVasePrincipalComponents(:,3),'*',"Color" ,color(6))
hold on
title("Principal Component Projection for Each Object")
xlabel('PC1'); ylabel('PC2'); zlabel('PC3');
legend('Acrylic','Black Foam','Car Sponge', 'Flour Sack', 'Kitchen Sponge','Steel Vase')
save("PCAF0Electrodes.mat", "projectionPrincipalComponents");










