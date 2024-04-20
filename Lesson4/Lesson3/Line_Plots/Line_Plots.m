%% Example 1

load  count.dat; % loads the count data set into Workspace
load NYCDiseases.mat; % loads the NYC diseases data into Workspace

%% Example 2

measles1931 = measles(1,:); % Measles cases in 1931 (row 1 of measles)
measles1941 = measles(11,:); % Measles cases in 1941 (row 11 of measles)
measlesMay = measles(:, 5); % May measles cases (column 5 of data set)
measlesSpring = measles(:, [ 3, 4, 5]); % Measles for March, April and May
mumps1931 = mumps(1,:); % Mumps cases in 1931 (row 1 of mumps set)

%% Example 3

figure
plot(count)
xlabel('24 hours of the day')
ylabel('Number of vehicles through the intersections')
title('Traffic Data Study')
legend('Durango', 'IH10', 'LP410')

%% Example 4

figure
plot(measles1931)
xlabel('Month')
ylabel('Cases')
title('Measles cases NYC: 1931')

%% Exercise 1

mumpsSummer = mumps(:, [6, 7, 8]);
chickenPox1931 = chickenPox(1,:);
figure
plot(chickenPox1931)
xlabel('Month')
ylabel('Cases')
title('Chickenpox cases NYC: 1931')

%% Example 5

figure
plot(measles1931./1000)
xlabel('Month')
ylabel('Cases (in Thousands)')
title('Measles cases NYC: 1931')

%% Example 6

figure
plot(years, measlesMay./1000)
xlabel('Year')
ylabel('Cases (in Thousands)')
title('Measles cases NYC: May(1931 - 1971)')

%% Example 7

figure
plot(years, measlesSpring./1000)
xlabel('Year')
ylabel('Cases (in Thousands)')
title('NYC measles cases for spring: 1931 - 1971)')
legend('March', 'April', 'May')

%% Exercise 2

figure
plot(years, mumpsSummer./1000)
xlabel('Year')
ylabel('Cases (in Thousands)')
title('NYC mumps cases for summer: 1931 - 1971')
legend('June', 'July', 'August')

%% Example 8

figure
hold on
plot(measles1931./1000)
plot(mumps1931./1000)
hold off
xlabel('Month')
ylabel('Cases (in Thousands)')
title('Compare Measles and Mump 1931')
legend('Measles', 'Mumps')

%% Exercise 3

figure
hold on
plot(measles1931./1000)
plot(mumps1931./1000)
plot(chickenPox1931./1000)
hold off
xlabel('Month')
ylabel('Cases (in Thousands)')
title('Compare Measles, Mump and Chickenpox 1931')
legend('Measles', 'Mumps', 'Chickenpox')





































