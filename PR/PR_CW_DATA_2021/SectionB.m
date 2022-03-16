
%NOT OUR SECTION 1 CODE DO NOT KEEP
step = 25;
num = 1000/step;
pvt = zeros(3, 60);
time = 50;


data = dir('data/*.mat');
for i = 1:length(data)
    load(data(i).name);

    pvt(1, i) = F0pdc(time);
    pvt(2, i) = F0pac(2,time);
    pvt(3, i) = F0tdc(time);
end

%pvt(:, :, 1) = [];

a_m = pvt(:, 1:10);
result.acrylic = a_m;

bf_m = pvt(:, 11:20);
result.black_foam = bf_m;

cs_m = pvt(:, 21:30);
result.car_sponge = cs_m;

fs_m = pvt(:, 31:40);
result.flour_sack = fs_m;

ks_m = pvt(:, 41:50);
result.kitchen_sponge = ks_m;

sv_m = pvt(:, 51:60);
result.steel_vase = sv_m;


save('F0_PVT.mat', 'result')


%Part 1 Section B

%a)
%Report Covariance matrix, eigen values, eigenvectors for the data

%Covariance matrix 
% - Combine struct to a single 3x60 matrix (TVP x all 10 trials on all 6
% objects)
% - Standardise (Subtract mean and divide by standard deviation)
% - Find covariance of the 3x60 matrix
concatenated_matrix = cat(2, result.acrylic, result.black_foam, result.car_sponge, result.flour_sack, result.kitchen_sponge, result.steel_vase);

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


nexttile
scatter(pc_one, 1, 'filled','r');
nexttile
scatter(pc_two, 2, 'filled','g');



%Part 2 Section B

%a)
%Use PCA to determine the principal components of electrode data. Report on
%the variances with a Scree plot


