%% Example 1 - Setup

load("DaphneIsland.txt");

%% Example 2 - Are the Father Beak Sizes averaging 10 mm?

ChildBeakSize = DaphneIsland(:,1);
MotherBeakSize = DaphneIsland(:,2);
FatherBeakSize = DaphneIsland(:,3);
[h1, p1, c1] = ttest(FatherBeakSize, 10);
fprintf(['Do the Father Beak Sizes average 10 mm?\n\t' ...
'h = %g, p = %g, ci = [%g, %g] \n'], h1, p1, c1);

%% Exercise 1 - Do Mother Finches have an average beak size of 10mm?

[h1, p1, c1] = ttest(MotherBeakSize, 10);
fprintf(['Do Mother Finches have an average beak size of 10mm?\n\t' ... 
'h = %g, p = %g, ci = [%g, %g] \n'], h1, p1, c1);
% Null Hypothesis: Mother beak sizes average 10mm
% Alternative hypothesis: Mother beak sizes do not average 10mm
% Significance level: alpha 0.05
% Result: The p- level is more than 0.05 so the h-value is 0 indicating
% that we accept the null hypothesis that the Mother beak sizes average
% 10mm. 

%% Example 3 - Do the mother and father have similar beak size?

[h3, p3, c3] = ttest2(MotherBeakSize,FatherBeakSize);
fprintf(['Do the Mother and Father have similar Beak Sizes?\n\t' ...
'h = %g, p = %g, ci = [%g, %g] \n'], h3, p3, c3);

%% Exercise 2 - Do Children and Mother Finches have similar average beak sizes?

[h4, p4, c4] = ttest2(ChildBeakSize, MotherBeakSize);
fprintf(['Do Children and Mother Finches have similar average beak sizes?\n\t' ...
    'h = %g, p = %g, ci = [%g, %g] \n'], h4, p4, c4);
% Null Hyp: Children and Mother Finches have similar average beak sizes
% Alt Hyp: Children and Mother Finches do not have similar average beak
% sizes
% Significance Level: alpha 0.05
% Result: The p-level is less than 0.05 so the h-value is 1 indicating that
% we accept the alternate hypothesis that the Children and Mother Finch
% average beak sizes are not similar. 

%% Example 4 - Calculate and output the Average Parent to Child beak size correlations

parent = mean(DaphneIsland(:, 2:3), 2); % Average the parent beak sizes
pCorr = corr(parent, ChildBeakSize);
fprintf('Parent-child beak correlation: %g\n', pCorr)

%% Exercise 3 

mCorr = corr(ChildBeakSize, MotherBeakSize);
fprintf('Child beak-Mother beak correlation: %g\n', mCorr)
fCorr = corr(ChildBeakSize, FatherBeakSize);
fprintf('Child beak-Father beak correlation: %g\n', fCorr)
% The correlation is higher than 0.5 indicating there is positive
% correlation between child beak size and Mother beak size. The correlation
% is higher than 0.7 indicating there is a positive correlation between
% child beak size and Father beak size. Of the two correlations, the
% positive correlation between the child and Father beak size is higher
% than the correlation between the child and Mother beak sizes. This
% indicates that the sizes of the child and Father beaks are more similar. 
%% Example 5 - Plot the average parent beak size against the child beak size
tString = ['Daphne island finches (corr = ' , num2str(pCorr) ')'];
figure('Name', tString) % Put title on the window
plot(parent, ChildBeakSize, 'ko') % Plot a scatter plot
xlabel('Parent beak size (mm)'); % Label the x-axis
ylabel('Child beak size (mm)'); % Label the y-axis
title(tString); % Put title on the graph

%% Example 7 - Calculate and output the best fit lines for beak par entage

pPoly = polyfit(parent, ChildBeakSize, 1); % Linear fit of parent vs child
fprintf('Model: child = %g*parent + %g\n', pPoly(1), pPoly(2))

%% Exercise 4

mPoly = polyfit(MotherBeakSize, ChildBeakSize, 1); 
fprintf('model: child = %g*parent + %g\n', mPoly(1), mPoly(2))

%% Example 8 Predict the child beak sizes from its parent beak sizes (Linear Model)

pPred = polyval(pPoly, parent); % Find parent-child relationship

%% Example 9 - Calculate the error between child beak sizes and the model 

pError = ChildBeakSize - pPred; % Actual - predicted by parent's size

%% Example 10 - Find mean square error (MSE)

pMSE = mean(pError.*pError);
fprintf('Mean squared prediction error: %g\n', pMSE);

%% Example 11 - Find root mean squared error (RMS)

pRMS = sqrt(pMSE);
fprintf('RMS prediction error: %g mm\n', pRMS);














