%% Example 1 - Load the consolidated sleep diary data (load)

load diaries.mat; % Load the sleep diaries
%% Example 2 - Calculate the number of students in section 2 (==)

sect2 = (section == 2); % sect2 has 1's corresponding to section 2 students
totalSect2 = sum(sect2); % Add up the true's (1's) to find number of students
fprintf('%g students in section 2\n', totalSect2);
%% Exercise 1

sect1 = (section == 1); 
totalSect1 = sum(sect1);
fprintf('%g students in section 1\n', totalSect1);

%% Example 3 - Find the average number of minutes students in section 2 took to fall asleep (indexing)
minutesSect2 = toSleepMinutes(:, sect2); % Pick columns of section 2
averMinutes2 = mean(minutesSect2(:)); % Find overall average of section 2
fprintf('Average minutes to sleep for section 2 students = %g \n', ...
averMinutes2);

%% Exercise 2

alarmSect2 = useAlarm(:,sect2);
averAlarmuse2 = mean(alarmSect2(:));
fprintf('Average alarm use suring studying for section 2 students = %g \n', averAlarmuse2)
%% Example 4 - Calculate the number of men in the cohort (strcmp)

men = strcmp(gender, 'male'); % 1's in positions corresponding to males
totalMen = sum(men); % Add to find number of men
fprintf('%g men in the cohort\n', totalMen);

%% Exercise 3

women = strcmp(gender, 'female');
totalWomen = sum(women);
fprintf('%g women in the cohort\n', totalWomen);

%% Example 5 - Calculate the % of men in the cohort
totalStudents = length(gender); % gender has an entry for each student
percentMen = 100.*totalMen./totalStudents;
fprintf('%g%% of the students in the cohort are men\n', percentMen);

%% Exercise 4

percentWomen = 100.*totalWomen./totalStudents;
fprintf('%g%% of the students in the cohort are women\n', percentWomen);
%% Example 6 - Calculate the number of men in section 2 using the And operator (&)
menSect2 = men & sect2; % 1's in positions of men in section 2
totalMen2 = sum(menSect2); % Add up the trues (1's)
fprintf('%g men in section 2\n', totalMen2);

%% Example 7 - Calculate total students in sections 2 or 3 (| - OR)
sect2or3 = (section == 2) | (section == 3); % 1's for section 2 or 3
fprintf('%g students in sections 2 or 3\n', sum(sect2or3));












