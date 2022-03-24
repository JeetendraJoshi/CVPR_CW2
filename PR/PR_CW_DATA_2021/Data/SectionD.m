clear all
close all
load("F0_PVT.mat")

%Normalize incoming PVT data
normalizedPVT = normalize(PVT);



%Visualise the output.

%Call the K-Means Clustering algorithm on the data using distance z
%Change the distance metric, repeat the clustering and comment on the change in the
%outcome.
z = "sqeuclidean";
[ids, CentralLocations] = kmeans(normalizedPVT(:, :), 6, "Distance", z);
figure;

%Plotting of Data Points
colors = ['r', 'g', 'b', 'm', 'k', 'c'];

% 
for i = 1:6
  color = colors(i);
  scatter3(normalizedPVT(ids==i,1),normalizedPVT(ids==i,2),normalizedPVT(ids==i,3),30,'filled',color); 
  grid on; hold on; 
  
end


%Plotting of Clusters
plot3(CentralLocations(:,1),CentralLocations(:,2),CentralLocations(:,3),'o','Color','b','MarkerSize',10,'MarkerFaceColor','y'); hold on;
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Centroids',...
       'Location','NW')
title (sprintf('Cluster Assignments and Centroids - %s', z))
xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');
set(gca,'Fontsize',18)
hold off


z = "correlation";
[ids, CentralLocations] = kmeans(normalizedPVT(:, :), 6, "Distance", z);

figure;

%Plotting of Data Points
colors = ['r', 'g', 'b', 'm', 'k', 'c'];

% 
for i = 1:6
  color = colors(i);
  scatter3(normalizedPVT(ids==i,1),normalizedPVT(ids==i,2),normalizedPVT(ids==i,3),30,'filled',color); 
  grid on; hold on; 
  
end


%Plotting of Clusters
plot3(CentralLocations(:,1),CentralLocations(:,2),CentralLocations(:,3),'o','Color','b','MarkerSize',10,'MarkerFaceColor','y'); hold on;
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Centroids',...
       'Location','NW')
title (sprintf('Cluster Assignments and Centroids - %s', z))
xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');
set(gca,'Fontsize',18)
hold off


load("PCAF0Electrodes.mat")
% Now apply bagging (bootstrap aggregation for an ensemble of decision trees) to the electrode
% data that was processed with PCA in section B.2.b. Use a 60 / 40 split for Training / Test data
DataSetSize = size(projectionPrincipalComponents);

%Concatenate Data array with a label column
fullDataset = [projectionPrincipalComponents zeros(DataSetSize(1), 1)];
%Create Labels for Every class
for i = 1:DataSetSize
    fullDataset(i, 4) = floor((i-1)/10) + 1;
end

% Split data into test and training split 40:60
[m,n] = size(fullDataset) ;
P = 0.6 ;
idx = randperm(m)  ;
Training = fullDataset(idx(1:round(P*m)),:) ; 
Testing = fullDataset(idx(round(P*m)+1:end),:) ;


% First tree bagging algorithm for OOB error calculation
treebag = TreeBagger(300,Training(:,1:3),Training(:,4),'SampleWithReplacement', 'on', 'OOBPrediction', 'on');


%Plot the OOB error per tree
figure;
err = oobError(treebag);
plot(err);
xlabel("Tree Number")
ylabel("Out of Bag Error")

%Specify the number of bags / trees you used. Why did you choose this number?

% Created Ensemble of 60 trees after looking at OOB calculation
n = 60;

betterBagging = TreeBagger(n,Training(:,1:3),Training(:,4),'SampleWithReplacement', 'on', 'OOBPrediction', 'on');


%Visualise two of your generated decision trees.
%Visualise 2 random trees from tree bagger
view(betterBagging.Trees{1}, 'Mode','graph')
view(betterBagging.Trees{10}, 'Mode','graph')

%Run the trained model with the test data. Display a confusion matrix (where the
%object type is the class) and comment on the overall accuracy.
%Predict across all test samples
YFIT = predict(betterBagging, Testing(:, 1:3));


% Converts Cell array to normal array for confusion matrix production
YFIT = cell2mat(YFIT);
YFIT_d = zeros(24,1);
for i = 1:24
   YFIT_d(i,1) = str2double(YFIT(i));
end
%Produces the confusion matrix

C = confusionmat(Testing(:, 4), YFIT_d);

figure;
confusionchart(C)
title("Confusion Matrix Chart")



