%% Example 1

load count.dat; % loads the count data set into Workspace
load NYCDiseases.mat; % loads the NYC disease data into Workspace

%% Example 2

measlesByMonth = sum(measles, 1); % sum along dim 1 (column totals)
measlesByYear = sum(measles, 2); % sum along dim 2 (row totals)
measlesTotal = sum(measlesByMonth); % sum of vector (overall total)

%% Example 3

totalMeasles = sum(measles(:)); % uses linearization to get total measles
totalMumps = sum(mumps(:)); % uses linearization to get total mumps
totalCP = sum(chickenPox(:)); % uses linearizztion to get total CP
totalDiseases = totalMeasles + totalMumps + totalCP; % adds cases
percentMeasles = 100 * (totalMeasles / totalDiseases); % calculates %

%% Exercise 1

percentMumps = 100 * (totalMumps / totalDiseases); 
percentCP = 100 * (totalCP / totalDiseases);
% The percent of Mumps out of total diseases was around 19%
% The percent of chickenPox out of total diseases was around 28%

%% Example 4

yearLabels = {'1931', '1932', '1933', '1934', '1935', '1936','1937', '1938', '1939','1940'};
figure
pie(measlesByYear(1:10), yearLabels)
title('Measles Yearly Case Totals:1931-40')

%% Exercise 2

figure
pie(measlesByYear(11:20), yearLabels)
title('Measles Yearly Case Totals:1931-40')
% The year with the highest number of cases was 1931. 
% The cases were high likley due to the lack of a Measles vaccine in 1931.

%% Example 5

mumpsByMonth = sum(mumps,1); % sum along dim 1 of mumps
chickenPoxByMonth = sum(chickenPox,1); % sum along dim 1 of chickenPox
byMonth = [ measlesByMonth', mumpsByMonth', chickenPoxByMonth'];
% creates new variable with transposed variables to put in 3 columns

%% Example 6

figure
bar(measlesByMonth./1000)
xlabel('Month')
ylabel('Cases (in thousands)')
title('Measles by Month NYC:1931-1971')

%% Example 7

mylabels = {'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'};
figure % Create a new figure
bar(measlesByMonth./1000) % Plot bar chart of monthly totals
xlabel('Month') % Label the x-axis
ylabel('Cases (in thousands)') % Label the y-axis
title('Measles by month in NYC: 1931-1971'); % Put title on the graph
set(gca,'XTickLabelMode', 'manual', ...% Manually label tick marks
'XTickLabel', mylabels)
xtickangle(45)

%% Exercise 3

figure
bar(mumpsByMonth./1000)
xlabel('Month')
ylabel('Cases (in thousands)')
title('Mumps by month in NYC: 1931-1971');
set(gca,'XTickLabelMode', 'manual', 'XTickLabel', mylabels)
xtickangle(45)

%% Example 8

figure
bar(byMonth./1000)
xlabel('Month')
ylabel('Cases (in thousands)')
title('Childhood diseases by month in NYC: 1931-1971')
legend('Measles', 'Mumps', 'Chicken Pox')

%% Example 9

figure
subplot(1,2,1)
bar(byMonth./1000)
xlabel('Month')
ylabel('Cases (in thousands)')
legend('Measles', 'Mumps', 'Chicken Pox')
title('Side by Side')
subplot(1,2,2)
bar(byMonth./1000, 'stacked')
xlabel('Month')
ylabel('Cases (in thousands)')
legend('Measles', 'Mumps', 'Chicken Pox')
title('Stacked')

%% Exercise 4

Durango = sum(1:24,1); 
IH10 = sum(count(2,:)); 
LP410 = sum(count(3,:)); 
totalIntersections = totalDurango + totalIH10 + totalLP410; 
intersectionLabels = {'Durango', 'IH10', 'LP410'};
DurangoByHour = sum(Durango,1); 
IH10ByHour = sum(IH10,1); 
LP410ByHour = sum(LP410,1);
byHour = [ DurangoByHour', IH10ByHour', LP410ByHour'];

figure
subplot(1,2,1)
bar(byHour./1000)
xlabel('Hour')
ylabel('Traffic (in thousands)')
legend('Durango', 'IH10', 'LP410')
title('Side by Side')
subplot(1,2,2)
pie(totalIntersections, intersectionLabels)
title('Traffic at Intersections')









































