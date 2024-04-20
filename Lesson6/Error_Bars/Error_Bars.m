%% Example 1

load count.dat; % loads the count data set into Workspace
load NYCDiseases.mat; % loads the NYC disease data into Workspace

%% Example 2

fprintf('chicken pox: mean = %g median = %g [max = %g and min = %g]\n', ...
mean(chickenPox(:)), median(chickenPox(:)), max(chickenPox(:)), min(chickenPox(:)));

%% Example 3

chickenPoxAver = mean(chickenPox(:)); % Calculate overall average chickenpox
chickenPoxSD = std(chickenPox(:), 0); % Calculate overall std chickenpox
figure
errorbar(chickenPoxAver./1000,chickenPoxSD./1000, 'rs')
xlabel('Disease')
ylabel('Monthly Cases (in Thousands)')
title('Chicken Pox Case Dispersion')
set(gca, 'XTickMode', 'manual', 'XTick', 1, ...
'XTickLabelMode', 'manual', 'XTickLabel', {'Chicken Pox'})

%% Exercise 1

IntersectionAver = mean(count(:)); 
IntersectionSD = std(count(:), 0);
figure
errorbar(IntersectionAver,IntersectionSD, 'rs')
xlabel('San Antonio Intersections')
ylabel('Number of Cars')
title('Overall Average Intersection Traffic')
set(gca, 'XTickMode', 'manual', 'XTick', 1, ...
'XTickLabelMode', 'manual', 'XTickLabel', {'Intersections'})

%% Example 4

ChickenPoxMedian = median(chickenPox(:));
ChickenPoxMAD = mad(chickenPox(:),1);
figure
hold on
errorbar(1, chickenPoxAver./1000, chickenPoxSD./1000, 'rs');
errorbar(2, ChickenPoxMedian./1000, ChickenPoxMAD./1000, 'ko');
hold off
xlabel('Chicken Pox Error Data')
ylabel('Monthly averages (in thousands)')
title('Childhood diseases NYC: 1931-1971 (SD Error Bars)')
set(gca, 'XTickMode', 'manual', 'XTick', 1:2, ...
'XTickLabelMode', 'manual', 'XTickLabel', {'Mean-SD', 'Median-MAD'}, ...
'XLim', [0.5, 2.5])

%% Example 5

measlesAver = mean(measles(:)); % Calculate overall average measles
measlesSD = std(measles(:), 1); % Calculate overall std measles
figure
hold on
errorbar(1, measlesAver./1000, measlesSD./1000, 'rs');
errorbar(2, chickenPoxAver./1000, chickenPoxSD./1000, 'ko');
hold off
xlabel('Disease')
ylabel('Monthly averages (in thousands)')
title('Childhood diseases NYC: 1931-1971 (SD Error Bars)')
set(gca, 'XTickMode', 'manual', 'XTick', 1:2, ...
'XTickLabelMode', 'manual', 'XTickLabel', {'Measles', 'Chicken Pox'}, ...
'XLim', [0.5, 2.5])

%% Exercise 2

% What doesn't make sense on the error bar in example 5 is that the
% Measles cases are measured in the negative numbers which is impossible as
% there cannot be a negative amount of Measles cases. There must've been an
% error in the data recording. 

%% Example 6

measlesByYearAver = mean(measles, 2); % Average monthly measles by year
measlesByYearSD = std(measles, 1, 2); % Std monthly measles by year

figure
errorbar(years,measlesByYearAver./1000, measlesByYearSD./1000, 'ks');
xlabel('Year');
ylabel('Monthly averages (in thousands)')
title('Measles NYC: 1931-1971 (SD Error bars)')
set(gca, 'YLimMod', 'manual', 'YLim', [0,20])

%% Exercise 3

% The y-label information should not have been cut off at zero because the
% recorded data dives into the negative numbers and the data isn't properly
% displayed on the graph. 
% The y-label information should be cut off at zero because the recorded 
% data below zero is inaccurate and is most likely derived from an error 
% in the data recording. 

% It is more ethical to accurately show the data even if the recorded data
% is likely to be derived from an error. A visual graph is better when the
% data is accurately shown and when the y-axis cuts off the data, it makes
% the graph misleading. 

% I tell the viewer that there may have been a few errors during the
% recording of the data but we accurately recorded the data we got on the
% graph. 

%% Example 7

measlesByMonthMedian = median(measles, 1); % Median by month
measlesByMonthMAD = mad(measles, 1, 1); % Median absolute deviation by month
measlesByMonthIQR = prctile(measles, [25, 75]); % Percentile for 25 and 75
lowerDist = measlesByMonthMedian - measlesByMonthIQR(1, :);
upperDist = measlesByMonthIQR(2,:) - measlesByMonthMedian;
xPositions = 1:12;
figure
hold on
errorbar(xPositions-0.1, measlesByMonthMedian./1000, ...
lowerDist./1000, upperDist./1000, 'm*')
errorbar(xPositions+0.1, measlesByMonthMedian./1000, ...
measlesByMonthMAD./1000, 'ks')
hold off
xlabel('Month');
ylabel('Median in thousands')
title('Measles cases in NYC: 1931-1971')
legend('IQR error bars', 'MAD error bars', 'Location', 'Northeast')

%% Exercise 4

mumpsByMonthMedian = median(mumps, 1);
mumpsByMonthMAD = mad(mumps, 1, 1); 
mumpsByMonthIQR = prctile(mumps, [25, 75]);
lowerDist = mumpsByMonthMedian - mumpsByMonthIQR(1, :);
upperDist = mumpsByMonthIQR(2,:) - mumpsByMonthMedian;
xPositions = 1:12;
figure
hold on
errorbar(xPositions-0.1, mumpsByMonthMedian./100, ...
lowerDist./100, upperDist./100, 'm*')
errorbar(xPositions+0.1, mumpsByMonthMedian./100, ...
mumpsByMonthMAD./100, 'ks')
hold off
xlabel('Month');
ylabel('Median in hundreds')
title('Mumps cases in NYC: 1931-1971')
legend('IQR error bars', 'MAD error bars', 'Location', 'Northeast')










