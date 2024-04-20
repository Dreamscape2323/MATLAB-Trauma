%% Substitute the appropriate values for your diary and run the script
diaryFile = 'CS1173SleepDiaryFall23.csv';    % Name of your .csv file
lastName = 'Zamora';                       % Your last name
firstName = 'Xander';                     % Your first name
gender = 'male';                           % Your gender ('male' or 'female')
section = 5;                                 % Your section number - Number - no letters or ' '

% Do not change anything below this line

diary = extractDiary(diaryFile, lastName, firstName, gender, section);
fprintf('1. Scroll up in the Command Window to where you see >> testScript \n')
fprintf('2. Review the Errors and Warnings to see if anything needs to be fixed \n')
fprintf('3. Make sure you address any issues with your data - ex: sleep more than 10 hours, etc.  \n')
fprintf('4. If your data is accurate and you got no errors, your conversion was successful. \n')
fprintf('5. Zip up the .csv file and your sleep diary file (Lastname_firstname_gender.mat) \n')
fprintf('     and submit the zip file into your assignment page\n');

