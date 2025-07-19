% Grade Categorization Program Using If Conditions

% Initialize variables
grade_A = 0;
grade_B = 0;
grade_C = 0;
grade_D = 0;
grade_E = 0;
grade_F = 0;

% Maximum number of students
max_students = 10;

% Loop to input student scores
for student = 1:max_students
    % Prompt user for a score
    score = input(['Enter the score for student ', num2str(student), ': ']);
    
    % Classify score into grades using if conditions
    if score >= 120 && score <= 150
        grade_A = grade_A + 1;
    elseif score >= 90 && score < 120
        grade_B = grade_B + 1;
    elseif score >= 60 && score < 90
        grade_C = grade_C + 1;
    elseif score >= 30 && score < 60
        grade_D = grade_D + 1;
    elseif score >= 10 && score < 30
        grade_E = grade_E + 1;
    elseif score >= 0 && score < 10
        grade_F = grade_F + 1;
    else
        disp('Invalid score. Please enter a value between 0 and 150.');
        student = student - 1; % Retry for the same student
    end
end

% Display grade summary
disp(['Grade A: ', num2str(grade_A)]);
disp(['Grade B: ', num2str(grade_B)]);
disp(['Grade C: ', num2str(grade_C)]);
disp(['Grade D: ', num2str(grade_D)]);
disp(['Grade E: ', num2str(grade_E)]);
disp(['Grade F: ', num2str(grade_F)]);