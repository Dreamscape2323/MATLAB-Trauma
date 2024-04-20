%% Example 1

NumBirds = 9; % defines a scalar numeric variable
Type_Birds = 'Crow'; % defines a scalar text variable

%% Exercise 1

my_age = 18; % defines a scalar numeric variable
my_abc123 = 'guz367'; % defines a scalar text variable

%% Example 2

BirdWeight = [6,5,4,8,5,6,3,6,8]; % defines a vector with 9 number elements
Crow_Colors = {"Black","White","Grey","Spotted"}; % defines a vector with 4 text element
x = [1,2,3,4,5,6,7,8]; % defines a two dimensional array

%% Exercise 2

Data_Array = [3,4;5,6;7,8;2,0]; % defines a two dimensional array

%% Example 3

load count.dat;
load NYCDiseases.mat;

%% Exercise 3

Durango_1am = count(1,1);

%% Example 4

measles1931 = measles(1,:); % Measles cases in 1931 (row 1 of Measles data set)
measles1941 = measles(11,:); % Measles cases in 1941 (row 11 of measles data set)
measlesMay = measles(:, 5); % May measles cases (column 5 of data set)
measlesSpring = measles(:, [ 3, 4, 5]); % Measles for March, April and May

%% Exercise 4

chickenPox1942 = chickenPox(12,:); % ChickenPox cases in 1931 (row 12 of chickenPox data set)
measlesApril = measles(:,4); % April Measles cases (column 4 of data set)
chickenPoxApril = chickenPox(:,4); % April ChickenPox cases (column 4 of data set)
mumpsSummer = mumps(:,[6,7,8]); % Mumps for June, July and August



















