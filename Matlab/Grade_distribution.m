% Initialize counters for each grade
countA = 0; countB = 0; countC = 0; countD = 0; countE = 0; countF = 0;

% Initialize student counter
student_count = 0;

% Maximum number of students
max_students = 10;

while student_count < max_students
    % Increment student count
    student_count = student_count + 1;
    
    % Input score for the current student
    score = input(['Enter score for Student ', num2str(student_count), ': ']);
    
    % Categorize grades using switch
    switch true
        case score <= 150 && score > 120
            countA = countA + 1;
        case score <= 120 && score > 90
            countB = countB + 1;
        case score <= 90 && score > 60
            countC = countC + 1;
        case score <= 60 && score > 30
            countD = countD + 1;
        case score <= 30 && score > 10
            countE = countE + 1;
        case score <= 10 && score >= 0
            countF = countF + 1;
        otherwise
            disp('Invalid score. Please enter a value between 0 and 150.');
            student_count = student_count - 1; % Do not count invalid input
    end
end

% Display total grades
fprintf('Grade A: %d\n', countA);
fprintf('Grade B: %d\n', countB);
fprintf('Grade C: %d\n', countC);
fprintf('Grade D: %d\n', countD);
fprintf('Grade E: %d\n', countE);
fprintf('Grade F: %d\n', countF);