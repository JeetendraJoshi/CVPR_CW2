%close all
load("F0_PVT.mat")



normalizedPVT = normalize(PVT);
[ids, CentralLocations] = kmeans(normalizedPVT(:, :), 6, "Distance", "cityblock");



figure;

colors = ['r', 'g', 'b', 'm', 'k', 'c'];

% Data Points
for i = 1:6
  color = colors(i);
  scatter3(normalizedPVT(idx==i,1),normalizedPVT(idx==i,2),normalizedPVT(idx==i,3),30,'filled',color); 
  grid on; hold on; 
  
end



plot3(CentralLocations(:,1),CentralLocations(:,2),CentralLocations(:,3),'o','Color','b','MarkerSize',10,'MarkerFaceColor','y'); hold on;
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Cluster 6','Centroids',...
       'Location','NW')
title ('Cluster Assignments and Centroids')
xlabel('Pressure'); ylabel('Vibration'); zlabel('Temperature');
set(gca,'Fontsize',18)
hold off


