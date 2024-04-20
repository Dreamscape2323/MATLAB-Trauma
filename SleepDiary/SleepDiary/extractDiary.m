function diary = extractDiary(fileName, lastName, firstName, gender, sec)

% Extract an individual sleep diary from a comma separated value file
%
% Parameters:
%    fileName = file name of the sleep diary (should be in the current directory)
%    lastName = your last name
%    firstName = your first name
%    gender = your gender
%    section = your section
%
% Output:
%    diary = output diary structure
%
%% Returns a diary structure for a single person or throws an error
    if nargin ~= 5
        error('Missing Entry from Test Script --extractDiary requires 5 items (arguments)');
    end
    firstName = strtrim(firstName);
    if isempty(firstName)
        fprintf('ERROR: You do not have a First Name in your Test Script. You must provide a nonblank first name\n')
        error('You do not have a First Name in your Test Script. You must provide a nonblank first name');
    end
    lastName = strtrim(lastName);
    if isempty(lastName)
        fprintf('ERROR: You do not have a Last Name in your Test Script. You must provide a nonblank last name\n')
        error('You do not have a Last Name in your Test Scrip. You musst provide a nonblank last name');
    end
    gender = lower(strtrim(gender));
    if strcmp(gender, 'male') ~= 1 && strcmp(gender, 'female') ~= 1
        fprintf('ERROR: You do not have a correct gender in your Test Script. You must provide a nonblank gender (male or female)\n')
        error('Gender must be either male or female: all lower case');
    end
    if ischar(sec)
        fprintf("ERROR: The section number you entered is: \'%s\' \n", sec);
        fprintf('ERROR: Section must be a number: do not put ticks around your section number\n')
        error('Section must be a number: do not put ticks around your section number')
        section = str2double(sec);
    else
        section = sec;
    end
    
%% Initial setup  
    fprintf('Processing %s\n', fileName);
    totalLines = 22;
    startMonth = 8;
    startDay = 24;
    startYear = 2023;
    startDateString = ...
        [num2str(startMonth) '/' num2str(startDay) '/' num2str(startYear)];
    startDate = datenum(startDateString, 23);
    
%% Load the lines of the file and check that there are the right number
    formatFile(fileName);
    fid = fopen(fileName);
    dLines = cell(totalLines);
    tLine = fgetl(fid);      % Read the first line
    
    for k = 1:totalLines
        if (tLine == -1)
            fprintf('ERROR: You are missing days in your log\n')
            fprintf(['File should have ' num2str(totalLines) ...
                ' but only has ' num2str(k-1) ' lines\n'])
            error(['File should have ' num2str(totalLines) ...
                ' but only has ' num2str(k-1) ' lines']);
        end
        tLine = strtrim(tLine);
        if isempty(tLine)
            fprintf(['ERROR: You have a blank line in your log at line ' num2str(k) ' \n'])
            fprintf(['ERROR: Update line  ' num2str(k) ' in your excel sheet and resubmit\n'])
            error(['Line ' num2str(k) ' should not be blank']);
        end
        dLines{k} = tLine;
        tLine = fgetl(fid);
    end
    
    if (tLine ~= -1)
        fprintf('WARNING: You have commas, blanks or data on line 23 in your excel csv. \n')
        fprintf('WARNING: Check to see if you have a data input error in your log  \n')
        warning(strcat('File should only have 22 lines -- check to see if you have data on line 23 in csv: ', tLine));
    end

    fclose(fid);

%% Verify each line
   numDays = totalLines - 1;
   bedTimes = zeros(numDays, 1);
   toSleepMinutes = zeros(numDays, 1);
   wakeTimes = zeros(numDays, 1);
   useAlarm = false(numDays, 1);
   dayCaffeine = false(numDays, 1);
   nightCaffeine = false(numDays, 1); 
   minutesNap = zeros(numDays, 1);
   minsAwake = zeros(numDays, 1);
   SSI = zeros(numDays, 1);
   theDate = startDate;
  
   for k = 1:numDays
       % Make sure the line has 9 comma separated values
       try
       tokens = regexp(dLines{k+1}, ',', 'split');
       if length(tokens) ~= 10
           fprintf(['Excel row ' num2str(k+1) ' has ' num2str(length(tokens)) ' values\n' ...  
            'You are missing data, you should have 10 values; Make sure you fill out all the SSI column\n']);
           error(['Excel row ' num2str(k+1) ' has ' num2str(length(tokens))  ' values\n' ...
               'You are missing data, you should have 10 values; Make sure you fill out all the SSI columns\n']);
       end

       % Make sure date is in the right format and that no dates are skipped    
       % myDate = datenum(tokens{1}, 'mm/dd/yyyy');  % specifies mm/dd/yyyy
       % format (old code) 

       theDateVec = datevec(theDate);
       myDateVec = datevec(tokens{1});
       if ~isequal(theDateVec, myDateVec)
           fprintf(['ERROR: Invalid date on line ' num2str(k+1) '. Check your excel dates, fix and resubmit\n ' ])
           error(['Invalid date on line ' num2str(k+1) ]);
       end
       % myDate = datenum(myDateVec); This is part of original script not
       % sure what it does
       
       % Make sure wake time is valid
       wakeTimes(k) = extractDate(theDate, tokens{7});
       if (wakeTimes(k) == -1)
           fprintf(['ERROR: Missing or Invalid waketime on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
           error(['Invalid wake-up time on line ' num2str(k+1) ...
               ': it is: ' tokens{7}]);
       end

       % Make sure bed time is valid
       bedTimes(k) = extractDate(theDate, tokens{6});
       if (bedTimes(k) == -1)
           fprintf(['ERROR: Missing or Invalid bedtime on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
           error(['Invalid bed time on line ' num2str(k+1) ': it is:' tokens{6}]);
       end
       
       if bedTimes(k) > wakeTimes(k)
           bedTimes(k) = bedTimes(k) - 1;
       end
       
        % make sure sleep time is appropriate
%       bedHours = (bedTimes - floor(wakeTimes)).*24;
        sleep(k) = (wakeTimes(k)-bedTimes(k))*24;
        if sleep(k)>10
            fprintf('WARNING: On DAY %i you had a total of  %4.2f Hours of sleep.  Is that accurate? \n', k, sleep(k));
            fprintf('WARNING: Check the bed and wake times on line %i in excel, update you excel and rerun\n', k+1);
            warning(['You report sleeping more than 10 hours on line: ' num2str(k+1) ...
                '  If this is not legitimate, check your bed and wake time: ' ... 
                'Make sure you have midnight as 0 and not 12 (noon)']);
        end
       
       % Check that toSleep minutes is a positive numerical value
       a = str2num(tokens{5}); %#ok<*ST2NM>
       if isempty(a) || ~isnumeric(a) || a < 0
           fprintf(['ERROR: Missing or Invalid Minutes to Sleep on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
           error(['Invalid minutes to sleep entry ' num2str(k+1) ...
               ' (should be non negative number): it is: ' tokens{5}]);
       end
       toSleepMinutes(k) = a;
      
       % Check that alarm use is a 0 or 1
       a = str2num(tokens{8});
       if isempty(a) || ~isnumeric(a) || (a ~= 0 && a ~= 1)
           fprintf(['ERROR: Invalid Use Alarm on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
           error(['Invalid use alarm entry ' num2str(k+1) ...
              ' (should be 0 or 1): it is: ' tokens{8}]);
       end
       if a == 1
           useAlarm(k) = true;
       end
       

       
       % Check that day caffeine is a 0 or 1
       a = str2num(tokens{2});
       if isempty(a) || ~isnumeric(a) || (a ~= 0 && a ~= 1)
          fprintf(['ERROR: Invalid Caffine Entry on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
          error(['Invalid day caffeine entry ' num2str(k+1) ...
              ' (should be 0 or 1): it is: ' tokens{2}]);
       end
       if a == 1
           dayCaffeine(k) = true;
       end
       
       % Check that night caffeine is a 0 or 1
       a = str2num(tokens{3});
       if isempty(a) || ~isnumeric(a) || (a ~= 0 && a ~= 1)
          fprintf(['ERROR: Invalid Caffine Entry on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
          error(['Invalid night caffeine entry ' num2str(k+1) ...
              ' (should be 0 or 1): it is: ' tokens{3}]);
       end
       if a == 1
           nightCaffeine(k) = true;
       end
       
       % Check minutes nap
       a = str2num(tokens{4});
       if isempty(a) || ~isnumeric(a) || a < 0
          fprintf(['ERROR: Invalid Minutes Napped Entry on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
          error(['Invalid minutes nap entry ' num2str(k+1) ...
              ' (should be non-negative number): it is: ' tokens{4}]);
       end
       minutesNap(k) = a;
       
       % Check minutes awake
       a = str2num(tokens{9});
       if isempty(a) || ~isnumeric(a) || a < 0
          fprintf(['ERROR: Invalid Minutes Awake at Night on line ' num2str(k+1) '. Check your excel info, fix and resubmit\n ' ])
          error(['Invalid minutes nap entry ' num2str(k+1) ...
              ' (should be non-negative number): it is: ' tokens{9}]);
       end
       minsAwake(k) = a;
       
       % Check SSI scores
       a = tokens{10};
       pos  = strfind('1234567', a);
       if isempty(pos)
          fprintf(['ERROR: Invalid SSI Entry on line ' num2str(k+1) '. It is ' a '. Check your excel info, fix and resubmit\n ' ])
          error(['Invalid SSI ' num2str(k+1) ' (should be  one of 1234567)']);
       elseif pos > 7
           a = '8';
       end
       SSI(k) = str2num(a);
       
       % On to the next date
       theDate = theDate + 1;
       catch ME
           error([ME.message ' :: Couldn''t parse line ' num2str(k) ': ' dLines{k+1} ]);
       end
   end
   
   % Do a plausibility check on the bedtimes
   bedHours = (bedTimes - floor(wakeTimes)).*24;
   badTimes = sum(bedHours <= -4);
   if badTimes > 0
       warning('extractDiary:badTimes', 'You had some bedtimes before 8 pm: check you are using 24 hour format')
   end

   % Save the diary in a structure
   diary.bedTimes = bedTimes; 
   diary.dayCaffeine = dayCaffeine;
   diary.nightCaffeine = nightCaffeine;
   diary.toSleepMinutes = toSleepMinutes;
   diary.useAlarm = useAlarm;
   diary.wakeTimes = wakeTimes;
   diary.lastName = lastName;
   diary.firstName = firstName;
   diary.gender = gender;
   diary.section = section;
   diary.minutesNap = minutesNap;
   diary.minsAwake = minsAwake;
   diary.SSI = SSI;

   % Save the structure
   outFile = [lastName '_' firstName '_' gender '.mat'];
   save (outFile, 'diary');
end

function myTime = extractDate(theDate, theTime)
     myTime = -1;
     sTimes = regexp(theTime, ':', 'split'); 
     if length(sTimes) ~= 2
         return;
     end
     sHours = sscanf(sTimes{1}, '%d');
     sMins = sscanf(sTimes{2}, '%d');
     if isempty(sHours) || isempty(sMins) || sHours < 0 || sHours > 23 || sMins < 0 || sMins > 59
         return; 
     end
     myTime = datenum(theTime, 15); % Convert the wake time to date number
     myTime = theDate + myTime - floor(myTime); % Get the hours of the wake time
end

%Cleans up the csv file to be used for data processing.
%Credit: Richard Tran, Michael Geyer, David Patrick
function formatFile(fileName)
    expression = '(,\s*)+\n$';
    expression2 = '(,\s*)+\n';
    replace = '';
    replace2 = '\n';
    newStr = regexprep(fileread(fileName),expression,replace);
    newStr2 = regexprep(newStr,expression2,replace2);
    [fid, errmsg] = fopen(fileName, 'w');
    if ~isempty(errmsg)
       fprintf(['ERROR: Close the Excel Spreadsheet, and then rerun the script\n' ])
       error(['Sleep Diary is Open in Excel and can not be modified']);
    end
    fprintf(fid, '%s', newStr2);
    fclose(fid);
end