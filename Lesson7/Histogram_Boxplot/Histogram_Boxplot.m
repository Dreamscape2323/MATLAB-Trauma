%% Example 1

load NYCDiseases.mat; % loads the NYC disease data into Workspace
load fisheriris.mat; % loads flower data set from MATLAB Library

%% Example 2 Create Histogram of Mumps Cases

histogram(mumps./1000)
xlabel('Cases per Month (in Thousands)')
ylabel('Instances of Cases')
title('Histogram of Mumps cases per Month')

%% Exercise 1

histogram(chickenPox./1000)
xlabel('Cases per Month (in Thousands)')
ylabel('INstances of Cases')
title('Histogram of Chicken Pox cases per Month')

%% Example 3 Compare Bin Sizes

figure
subplot(3, 1, 1) % ---Top graph---
histogram(mumps./1000, 10) % Plot a 10-bin histogram
title('Comparison of Bins') % Put title over topmost graph
legend('10 Bins')
ylabel('Instance of Cases')
subplot(3, 1, 2) % ---Middle graph---
histogram(mumps./1000, 25) % Plot a 25-bin histogram
legend('25 bins')
ylabel('Instance of Cases')
subplot(3, 1, 3) % ---Bottom graph---
histogram(mumps./1000, 100) % Plot a 100-bin histogram
legend('100 bins')
ylabel('Instance of Cases')
xlabel('Cases per Month (in Thousands)') % Only label bottom x-axis

%% Example 2

figure
subplot(3, 1, 1) 
histogram(measles./1000, 10) 
title('Comparison of Bins') 
legend('10 Bins')
ylabel('Instance of Cases')
subplot(3, 1, 2) 
histogram(measles./1000, 25) 
legend('25 bins')
ylabel('Instance of Cases')
subplot(3, 1, 3) 
histogram(measles./1000, 100)
legend('100 bins')
ylabel('Instance of Cases')
xlabel('Cases per Month (in Thousands)')

% I would pick 10 bins because the data is easier to view with larger bins.
% There is a lot of white space on the right side of the graph because the
% x-axis of the graph goes to 25, however, the measles data only goes over
% 12 months which is less than half of the 25 points shown on the graph.
% This indicates that the x-axis is too big for the data provided as it
% only needs to go up to 12. 

%% Example 4 Box Plots of Disease Data

totalMonthyDiseaseCases = [sum(measles)', sum(mumps)', sum(chickenPox)'];
Diseases = {'Measles', 'Mumps','Chicken Pox'};
figure
boxplot(totalMonthyDiseaseCases, "Labels", Diseases)
ylabel('Total Monthly Cases')
title('Comparison of Disease Cases per Month for NYC')

%% Example 5 Box plot using group vector to determine columns
sepalLens = meas(:, 1); % Define a variable for the sepal length
figure
boxplot(sepalLens, species) % The species vector specifies the group
ylabel('Sepal length in mm')
title('Comparison of three species in the Fisher iris data')

%% Exercise 3

petalLens = meas(:, 3); 
figure
boxplot(petalLens, species) 
ylabel('Petal length in mm')
title('Comparison of Petal Length of three species in the Fisher iris data')

%% Example 6 Adding a Notch to a Box Plot
sepalWidths = meas(:, 2); % Define a variable for the sepal widths
figure
boxplot(sepalWidths, species, 'notch', 'on')
ylabel('Sepal width in mm')
title('Comparison of three species in the Fisher iris data')

%% Exercise 4 

% True
% You cannot tell how many data elements are in the each data section on a
% box plot. 








