close all
load("F0_PVT.mat")

normalizedPVT = normalize(PVT);

z = "correlation";
[ids, CentralLocations] = kmeans(normalizedPVT(:, :), 6, "Distance", z);

figure;

colors = ['r', 'g', 'b', 'm', 'k', 'c'];

% Data Points
for i = 1:6
  color = colors(i);
  scatter3(normalizedPVT(ids==i,1),normalizedPVT(ids==i,2),normalizedPVT(ids==i,3),30,'filled',color); 
  grid on; hold on; 
  
end



plot3(CentralLocations(:,1),CentralLocations(:,2),CentralLocations(:,3),'o','Color','b','MarkerSize',10,'MarkerFaceColor','y'); hold on;
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Centroids',...
       'Location','NW')
title (sprintf('Cluster Assignments and Centroids - %s', z))
xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');
set(gca,'Fontsize',18)
hold off


load("PCAF0Electrodes.mat")

DataSetSize = size(projectionPrincipalComponents);


fullDataset = [projectionPrincipalComponents zeros(DataSetSize(1), 1)];

for i = 1:DataSetSize
    fullDataset(i, 4) = floor((i-1)/10) + 1;
end


[m,n] = size(fullDataset) ;
P = 0.6 ;
idx = randperm(m)  ;
Training = fullDataset(idx(1:round(P*m)),:) ; 
Testing = fullDataset(idx(round(P*m)+1:end),:) ;



treebag = TreeBagger(300,Training(:,1:3),Training(:,4),'SampleWithReplacement', 'on', 'OOBPrediction', 'on');

figure;
err = oobError(treebag);
plot(err);
xlabel("Tree Number")
ylabel("Out of Bag Error")


n = 60;

betterBagging = TreeBagger(n,Training(:,1:3),Training(:,4),'SampleWithReplacement', 'on', 'OOBPrediction', 'on');

r = randi([0 n-1], 1 , 2);

view(betterBagging.Trees{r(1)}, 'Mode','graph')
view(betterBagging.Trees{r(2)}, 'Mode','graph')

YFIT = predict(betterBagging, Testing(:, 1:3));

YFIT = cell2mat(YFIT);
YFIT_d = zeros(24,1);
for i = 1:24
   YFIT_d(i,1) = str2double(YFIT(i));
end
%This is the confusion matrix
C = confusionmat(Testing(:, 4), YFIT_d);

figure;
confusionchart(C)
title("Confusion Matrix Chart")



