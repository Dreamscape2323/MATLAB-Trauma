%% Part 1

load count.dat;
load Zamora_Xander_male.mat;

waketime = (diary.wakeTimes - floor(diary.wakeTimes))*24;
bedtime = (diary.bedTimes - floor(diary.wakeTimes))*24;
hoursSleep = waketime - bedtime;
totalDailySleep = hoursSleep + (diary.minutesNap/60)-(diary.minsAwake/60) - (diary.toSleepMinutes/60);
%% Part 2

bedtime = reshape(bedtime, 7,3)';







