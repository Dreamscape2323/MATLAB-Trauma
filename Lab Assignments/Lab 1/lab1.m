
%% Lab 1

%% Section 1

load count.dat;
load TexasCovid19.mat;

%% Section 2
bexar20 = TexasCovidDec20(:,1);
comal20 = TexasCovidDec20(:,2);
dallas20 = TexasCovidDec20(:,3);
harris20 = TexasCovidDec20(:,4);
kendall20 = TexasCovidDec20(:,5);
tarrant20 = TexasCovidDec20(:,6);
figure
hold on
plot(bexar20./1000)
plot(comal20./1000)
plot(dallas20./1000)
plot(harris20./1000)
plot(kendall20./1000)
plot(tarrant20./1000)
hold off
xlabel('December 2020 (days)')
ylabel('Covid Cases (in Thousands)')
title('Compare Covid Cases at Texas Counties in December 2020')
legend('Bexar', 'Comal', 'Dallas', 'Harris', 'Kendall', 'Tarrant')

%% Section 3

bexar21 = TexasCovidDec21(:,1);
comal21 = TexasCovidDec21(:,2);
dallas21 = TexasCovidDec21(:,3);
harris21 = TexasCovidDec21(:,4);
kendall21 = TexasCovidDec21(:,5);
tarrant21 = TexasCovidDec21(:,6);
figure
hold on
plot(bexar21./1000)
plot(comal21./1000)
plot(dallas21./1000)
plot(harris21./1000)
plot(kendall21./1000)
plot(tarrant21./1000)
hold off
xlabel('December 2021 (days)')
ylabel('Covid Cases (in Thousands)')
title('Compare Covid Cases at Texas Counties in December 2021')
legend('Bexar', 'Comal', 'Dallas', 'Harris', 'Kendall', 'Tarrant')

%% Section 4

figure
hold on
plot(bexar21./1000)
plot(dallas21./1000)
plot(harris21./1000)
plot(tarrant21./1000)
hold off
xlabel('December 2021 (days)')
ylabel('Covid Cases (in Thousands)')
title('Compare Covid Cases at Four Major Cities in December 2021')
legend('San Antonio', 'Dallas', 'Houston', 'Fort Worth')

%% Section 5

figure
hold on
plot(comal21./10)
plot(kendall21./10)
hold off
xlabel('December 2021 (days)')
ylabel('Covid Cases (in Tens)')
title('Compare Covid Cases at Two Smaller Cities in December 2021')
legend('New Braunfels', 'Boerne')








