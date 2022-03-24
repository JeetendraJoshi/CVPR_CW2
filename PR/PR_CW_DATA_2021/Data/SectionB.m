clear all
close all
load("F0_PVT.mat")
%Part 1 Section B

%Initialise Object Colours
color = ['r', 'g', 'b', 'm', 'k', 'c'];

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

%Assign objects to correct points
acrylicPoints = concatenated_matrix(:, 1:10);
blackFoamPoints = concatenated_matrix(:, 11:20);
carSpongePoints = concatenated_matrix(:, 21:30);
flourSackPoints = concatenated_matrix(:, 31:40);
kitchenSpongePoints = concatenated_matrix(:, 41:50);
steelVasePoints = concatenated_matrix(:, 51:60);

%Plotting standardised matrix

figure;
plot3(acrylicPoints(1,:),acrylicPoints(2,:), acrylicPoints(3,:),'*',"Color", color(1));
hold on
plot3(blackFoamPoints(1,:),blackFoamPoints(2,:), blackFoamPoints(3,:),'*',"Color", color(2));
hold on
plot3(carSpongePoints(1,:),carSpongePoints(2,:), carSpongePoints(3,:),'*',"Color", color(3));
hold on
plot3(flourSackPoints(1,:),flourSackPoints(2,:), flourSackPoints(3,:),'*',"Color", color(4));
hold on
plot3(kitchenSpongePoints(1,:),kitchenSpongePoints(2,:), kitchenSpongePoints(3,:),'*',"Color", color(5));
hold on
plot3(steelVasePoints(1,:),steelVasePoints(2,:), steelVasePoints(3,:),'*',"Color", color(6));
hold on

%Displaying eigen vectors
x = [ matrix_eig_vects(1, 1), matrix_eig_vects(2, 1), matrix_eig_vects(3, 1)];
y = [ matrix_eig_vects(1, 2), matrix_eig_vects(2, 2), matrix_eig_vects(3, 2)];
z = [ matrix_eig_vects(1, 3), matrix_eig_vects(2, 3), matrix_eig_vects(3, 3)];

%PC3
plot3([0; x(1)], [0; y(1)], [0; z(1)],"Color", '#D95319');
%PC2
plot3([0; x(2)], [0; y(2)], [0; z(2)],"Color", '#7E2F8E');
%PC1
plot3([0; x(3)], [0; y(3)], [0; z(3)],"Color", '#77AC30');

title("3D Plot of Standaradised Data");
xlabel("x");
ylabel("y");
zlabel("z");
legend('Acrylic','Black Foam','Car Sponge', 'Flour Sack', 'Kitchen Sponge','Steel Vase', 'PC3','PC2', 'PC1');
grid on
hold off

%c)
%Reduce the data to 2-dimensions and replot.

%two largest eigenvalues are column 3 then column 2, choose those eigenvectors
%multiply this feature vector matrix with the original data

feature_vector = [matrix_eig_vects(:,3), matrix_eig_vects(:,2)]; 

two_d_plot = concatenated_matrix.' * feature_vector;

%Assign objects to correct points
acrylicPoints2d = two_d_plot(1:10, :);
blackFoamPoints2d = two_d_plot(11:20, :);
carSpongePoints2d = two_d_plot(21:30, :);
flourSackPoints2d = two_d_plot(31:40, :);
kitchenSpongePoints2d = two_d_plot(41:50, :);
steelVasePoints2d = two_d_plot(51:60, :);


figure;
plot(acrylicPoints2d(:, 1),acrylicPoints2d(:, 2),'*',"Color", color(1));
hold on
plot(blackFoamPoints2d(:, 1),blackFoamPoints2d(:, 2),'*',"Color", color(2));
hold on
plot(carSpongePoints2d(:, 1),carSpongePoints2d(:, 2),'*',"Color", color(3));
hold on
plot(flourSackPoints2d(:, 1),flourSackPoints2d(:, 2),'*',"Color", color(4));
hold on
plot(kitchenSpongePoints2d(:, 1),kitchenSpongePoints2d(:, 2),'*',"Color", color(5));
hold on
plot(steelVasePoints2d(:, 1),steelVasePoints2d(:, 2),'*',"Color", color(6));
hold on


x = [matrix_eig_vects(2, 1), matrix_eig_vects(3, 1)];
y = [matrix_eig_vects(2, 2), matrix_eig_vects(3, 2)];

%Plot Principal Component Lines

%PC2
plot([0; x(1)], [0; y(1)],"Color", '#7E2F8E');
%PC1
plot([0; x(2)], [0; y(2)],"Color", '#77AC30');
title("2D Projection onto Principle Components");
xlabel("PC1");
ylabel("PC2");
legend('Acrylic','Black Foam','Car Sponge', 'Flour Sack', 'Kitchen Sponge','Steel Vase', 'PC2', 'PC1');
grid on
hold off


%d)
%Show how the data is distributed across all PCs by plotting as separate 1D
%number lines


% Choose the Largest Feature vector which is first element in feature_vector
one_d_plot_pc1 = concatenated_matrix.' * feature_vector(:,1);
one_d_plot_pc2 = concatenated_matrix.' * feature_vector(:,2);

%Or take the corresponding values straight from the 2D plot.
%one_d_plot_pc1 = [two_d_plot(: , 1)];
%one_d_plot_pc1 = [two_d_plot(: , 2)];


%Assign objects to correct points

%PC1
acrylicPoints1d = one_d_plot_pc1(1:10, 1);
blackFoamPoints1d = one_d_plot_pc1(11:20, 1);
carSpongePoints1d = one_d_plot_pc1(21:30, 1);
flourSackPoints1d = one_d_plot_pc1(31:40, 1);
kitchenSpongePoints1d = one_d_plot_pc1(41:50, 1);
steelVasePoints1d = one_d_plot_pc1(51:60, 1);
%PC2
acrylicPoints1d_pc2 = one_d_plot_pc2(1:10, 1);
blackFoamPoints1d_pc2 = one_d_plot_pc2(11:20, 1);
carSpongePoints1d_pc2 = one_d_plot_pc2(21:30, 1);
flourSackPoints1d_pc2 = one_d_plot_pc2(31:40, 1);
kitchenSpongePoints1d_pc2 = one_d_plot_pc2(41:50, 1);
steelVasePoints1d_pc2 = one_d_plot_pc2(51:60, 1);


figure;
nexttile
hold on;
plot(acrylicPoints1d(:, 1), 1,'*',"Color", color(1));
hold on
plot(blackFoamPoints1d(:, 1), 1,'*',"Color", color(2));
hold on
plot(carSpongePoints1d(:, 1), 1,'*',"Color", color(3));
hold on
plot(flourSackPoints1d(:, 1), 1,'*',"Color", color(4));
hold on
plot(kitchenSpongePoints1d(:, 1), 1,'*',"Color", color(5));
hold on
plot(steelVasePoints1d(:, 1), 1,'*',"Color", color(6));
grid on
title("1-D Projection onto Principal Component 1");
set(gca,'YTickLabel',{' '})
nexttile
hold on;
plot(acrylicPoints1d_pc2(:, 1), 1,'*',"Color", color(1));
hold on
plot(blackFoamPoints1d_pc2(:, 1), 1,'*',"Color", color(2));
hold on
plot(carSpongePoints1d_pc2(:, 1), 1,'*',"Color", color(3));
hold on
plot(flourSackPoints1d_pc2(:, 1), 1,'*',"Color", color(4));
hold on
plot(kitchenSpongePoints1d_pc2(:, 1), 1,'*',"Color", color(5));
hold on
plot(steelVasePoints1d_pc2(:, 1), 1,'*',"Color", color(6));
title("1-D Projection onto Principal Component 2");
set(gca,'YTickLabel',{' '})
grid on

hold off



%Part 2 Section B

%a)
%Use PCA to determine the principal components of electrode data. Report on
%the variances with a Scree plot

load("F0Electrodes.mat");

% Electrode Data is normalized across the 19 electrodes
normalisedElectrodes = normalize(ElectrodesData);

% Covariance Matrix for the Electrode Data
covMat = cov(normalisedElectrodes);

% 19 x 19 Eigenvector produced
[covEigenVectorsFull, covEigenValuesFull] = eig(covMat);

% The Eigenvalues are extracted from the diagonal and flipped to make them
% descending order
screePlotY = flip(diag(covEigenValuesFull));

%Scree Plot produced from eigen values
figure;
plot(1:19, screePlotY, '-o');
title("Scree Plot for Electrode Data")
xlabel("Electrodes")
ylabel("Eigenvalues")

%Extract top 3 eigenvectors - Could be optimised by extracting from
%preliminary matrix
[covEigenVectors, covEigenValues] = eigs(covMat, 3);

%Project the data on to the 3 Principal Components
projectionPrincipalComponents = normalisedElectrodes *covEigenVectors;



%Visualize the electrode data using the three principal components with largest
%variance. 

%Plot the data accordingly per object and ensures colours are consistent
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










