%% EXAMPLE 1: Load the fetal size data

load toRump.txt; % Load the crown-to-rump data
load toHeel.txt; % Load the crown-to-heel data
weeks = [toRump(:, 1); toHeel(2:end, 1)]; % Remove first row of second dataset
mass = [toRump(:, 3); toHeel(2:end, 3)];
weight = mass .* 0.00220462262; % Convert grams to pounds

%% Example 2 Create a collection of 25 samples with a mean of 0 and SD of 1
% Each sample has a size of 10 elements

numSamples = 25;
sampleSize = 10;
popStd = 1;
popMean = 0;
samples = random('norm', popMean, popStd, sampleSize, numSamples);

%% Example 3 Calculate the mean of each sample and create a histogram to display the distribution

sampleMeans = mean(samples);
figure
histogram(sampleMeans,10)
xlabel('Sample Means')
ylabel('Mean Value')
title(['25 Samples from normal random distribution (sample size=' num2str(sampleSize) ')'])

%% Example 4 Create new sample of 1000 and show the distribution of sample means

numSamples2 = 1000;
sampleSize2 = 10;
popStd2 = 1;
popMean2 = 0;
samples2 = random('norm', popMean2, popStd2, sampleSize2, numSamples2);
sampleMeans2 = mean(samples2);
figure
histogram(sampleMeans2,10)
xlabel('Sample #');
ylabel('Mean Value');
title(['1000 Samples from normal random distribution (sample size=' num2str(sampleSize2) ')'])

%% Exercise 1

% I would use the mean of 0 as a good estimator of the overall population
% mean because it aligns the data in a nearly symmetrical, unimodal graph
% making thebdata easy to analyze. 

% The second graph with the sample of 1000 helped me make a better
% determination.

% I think adding more samples would help determine the accuracy of using 0
% as the mean of the population because there would be more variation
% during the random selection for the sample size leading to the data on
% the graph to look as accurate as possible. 

%% Exercise 2

% The food court at the JPL would be a better spot to find data about
% 'average' height because it's a area where nearly everyone ends up walking
% through, going to study, or eating. If looking for data on 'average' height 
% you may get biased data as the athletics center of excellence will have
% athletes within it who usually have a larger stature and size making you
% get on overestimation in your data possibly leading to outliers.

%% Example 4 Calculate SEM and display in an Error Bar
actualSampleStds = std(samples, 1); % RMS errors of the samples from their mean
unbiasedSampleStds = std(samples); % Unbiased sample standard deviations
sampleSEMs = unbiasedSampleStds./sqrt(sampleSize);
figure
errorbar(sampleMeans,sampleSEMs, 'ks')
xlabel('Samples')
ylabel('Mean')
title('25 Sample means with SEM Error bars' )

%% EXAMPLE 5: Calculate the weekly rate of change of fetal weight
poundsPerWeek = diff(weight)./ diff(weeks); % Weekly rate of change
weekMid = (weeks(1:(end-1)) + weeks(2:end))./2; % Week midpoints for plotting

%% EXAMPLE 6: Plot the weight and rate of change of weight
figure('Color', [1, 1, 1]) % New figure
ax = plotyy(weeks, weight, weekMid, poundsPerWeek); % Save axes
xlabel(ax(1), 'Weeks') % Label x-axis of left axis
ylabel(ax(1), 'Fetal weight (lbs)') % Label y-axis of left axis
ylabel(ax(2), 'Fetal growth rate (lbs/wk)') % Label y-axis of right axis
title('Characterization of fetal weight during pregnancy') % Title one of the axes

%% Exercise 3

% The fetus weight growth begins to slow down at around week 36.

% The downward slope after week 35 on the graph indicates that the fetal
% growth rate is decreasing. This means that the fetus is close to reaching
% it's final size in the third trimester where the fetus will no longer
% have to grow. The blue line indicates the change in the fetus weight
% during the pregnancy. 

