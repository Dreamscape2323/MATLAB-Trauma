%% Part 1

load count.dat;
load Zamora_Xander_male.mat;
waketime = (diary.wakeTimes - floor(diary.wakeTimes))*24;
bedtime = (diary.bedTimes - floor(diary.wakeTimes))*24;
hoursSleep = waketime - bedtime;
totalDailySleep = hoursSleep + (diary.minutesNap/60) - (diary.toSleepMinutes/60);

%% Part 2

waketimeAver = mean(waketime(:));
fprintf('Average wake-up time-hours: %g\n',waketimeAver);
fprintf('waketime: median = %g [max = %g and min = %g]\n', ...
median(waketime(:)), max(waketime(:)), min(waketime(:)));

bedtimeAver = mean(bedtime(:));
fprintf('Average bed time-hours: %g\n',bedtimeAver);
fprintf('bedtime: median = %g [max = %g and min = %g]\n', ...
median(bedtime(:)), max(bedtime(:)), min(bedtime(:)));

hoursSleepAver = mean(hoursSleep(:));
fprintf('Average hours of sleep: %g\n',hoursSleepAver);
fprintf('hoursSleep: median = %g [max = %g and min = %g]\n', ...
median(hoursSleep(:)), max(hoursSleep(:)), min(hoursSleep(:)));

toSleepMinutesAver = mean(diary.toSleepMinutes(:));
fprintf('Average minutes to sleep: %g\n',toSleepMinutesAver);
fprintf('diary.toSleepMinutes: median = %g [max = %g and min = %g]\n', ...
median(diary.toSleepMinutes(:)), max(diary.toSleepMinutes(:)), min(diary.toSleepMinutes(:)));

minutesNapAver = mean(diary.minutesNap(:));
fprintf('Average minutes napping: %g\n',minutesNapAver);
fprintf('diary.minutesNap: median = %g [max = %g and min = %g]\n', ...
median(diary.minutesNap(:)), max(diary.minutesNap(:)), min(diary.minutesNap(:)));

minsAwakeAver = mean(diary.minsAwake(:));
fprintf('Average minutes awake during the night: %g\n',minsAwakeAver);
fprintf('diary.minsAwake: median = %g [max = %g and min = %g]\n', ...
median(diary.minsAwake(:)), max(diary.minsAwake(:)), min(diary.minsAwake(:)));

totalDailySleepAver = mean(totalDailySleep(:));
fprintf('Average total daily sleep: %g\n',totalDailySleepAver);
fprintf('totalDailySleep: median = %g [max = %g and min = %g]\n', ...
median(totalDailySleep(:)), max(totalDailySleep(:)), min(totalDailySleep(:)));

SSIAver = mean(diary.SSI(:));
fprintf('Average Stanford Sleepiness Scale (SSI): %g\n',SSIAver);
fprintf('diary.SSI: median = %g [max = %g and min = %g]\n', ...
median(diary.SSI(:)), max(diary.SSI(:)), min(diary.SSI(:)));

fprintf('waketime     bedtime     hoursSleep  toSleepMinutes  minutesNap minsAwake totalDailySleep SSI\n'); 
fprintf('Mean: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n', ...
mean(waketime(:)), mean(bedtime(:)), mean(hoursSleep(:)), mean(diary.toSleepMinutes(:)), mean(diary.minutesNap(:)), mean(diary.minsAwake(:)), mean(totalDailySleep(:)), mean(diary.SSI(:)));
fprintf('Median: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n', ...
median(waketime(:)), median(bedtime(:)), median(hoursSleep(:)), median(diary.toSleepMinutes(:)), median(diary.minutesNap(:)), median(diary.minsAwake(:)), median(totalDailySleep(:)), median(diary.SSI(:)));
fprintf('Max: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n', ...
max(waketime(:)), max(bedtime(:)), max(hoursSleep(:)), max(diary.toSleepMinutes(:)), max(diary.minutesNap(:)), max(diary.minsAwake(:)), max(totalDailySleep(:)), max(diary.SSI(:)));
fprintf('Min: %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f\n', ...
min(waketime(:)), min(bedtime(:)), min(hoursSleep(:)), min(diary.toSleepMinutes(:)), min(diary.minutesNap(:)), min(diary.minsAwake(:)), min(totalDailySleep(:)), min(diary.SSI(:)));

%% Part 3

useAlarm = sum(diary.useAlarm([1,2,3,4,5,6,7,8,13,15,17,20,21],1));
AlarmTot = sum(diary.useAlarm(:,:));
PrctuseAlarm = 100*(useAlarm/AlarmTot);

usedayCaf = sum(diary.dayCaffeine([2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21],1));
dayCafTot = sum(diary.dayCaffeine(:,:));
PrctusedayCaf = 100*(usedayCaf/dayCafTot);

usenightCaf = sum(diary.nightCaffeine([3,7,10,11,12,13,21],1));
nightCafTot = sum(diary.nightCaffeine(:,:));
PrctusenightCaf = 100*(usenightCaf/nightCafTot);

useCaf = usedayCaf + usenightCaf;
CafTot = dayCafTot + nightCafTot;
PrctuseCaf = 100*(useCaf/CafTot);

dayNap = 2;
NapTot = 21;
PrctdayNap = 100*(dayNap/NapTot);

%% Part 4




















