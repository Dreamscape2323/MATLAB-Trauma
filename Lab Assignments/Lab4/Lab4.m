%% Part 1

load diariesFall2023.mat
waketime = (wakeTimes - floor(wakeTimes))*24;
bedtime = (bedTimes - floor(wakeTimes))*24;
hoursSleep = waketime - bedtime;
totalDailySleep = hoursSleep + (minutesNap/60)-(minsAwake/60) - (toSleepMinutes/60);
%% Part 2


