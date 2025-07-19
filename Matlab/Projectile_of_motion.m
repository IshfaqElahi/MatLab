% Define the time vector for simulation
t = 0:0.1:20;
% Define and simulate projectile motion for different angles (theta)
% First case: theta = pi/12
theta = pi/12;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p1 = plot(x, y, 'b-.', 'LineWidth', 1.5, 'Marker', '+'); % Blue dash-dot line with '+' markers
grid on;
hold on;
% Second case: theta = 5*pi/36
theta = 5 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p2 = plot(x, y, 'g-.', 'LineWidth', 1.5, 'Marker', 'hexagram'); % Green dash-dot line with hexagram markers
hold on;
% Third case: theta = 7*pi/36
theta = 7 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p3 = plot(x, y, 'y-.', 'LineWidth', 1.5, 'Marker', '.'); % Yellow dash-dot line with dot markers
hold on;
% Fourth case: theta = pi/4
theta = pi / 4;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p4 = plot(x, y, 'r', 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', 'square'); % Red squares
hold on;
% Fifth case: theta = 11*pi/36
theta = 11 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p5 = plot(x, y, 'c-.', 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', 'diamond'); % Cyan diamonds
hold on;
% Sixth case: theta = 13*pi/36
theta = 13 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p6 = plot(x, y, 'k-.', 'LineWidth', 1.5, 'Marker', 'o'); % Black circles
hold on;
% Seventh case: theta = 5*pi/12
theta = 5 * pi / 12;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;
p7 = plot(x, y, 'm-.', 'LineStyle', 'none', 'LineWidth', 1.5, 'Marker', '*'); % Magenta stars
% Set axis limits, title, labels, and legend for the projectile motion plot
axis([0 150 0 100]);
title('Analyzing Projectile Motion');
xlabel('Horizontal Distance, x (m)');
ylabel('Vertical Height, y (m)');
legend([p1, p2, p3, p4, p5, p6, p7], {'15°', '25°', '35°', '45°', '55°', '65°', '75°'});
% Analyzing range vs angle
theta = pi/12:pi/18:5*pi/12; % Define angles in radians
thetadeg = rad2deg(theta); % Convert to degrees
disp(thetadeg);
% Calculate range for each angle
range = (30 * cos(theta)) .* ((30 * sin(theta) + sqrt((30 * sin(theta)).^2 + 2 * 9.81 * 50)) / 9.81);
subplot(2, 2, 1);
plot(thetadeg, range, '-o'); % Plot range vs angle
xlabel('Angle (degrees)');
ylabel('Range (m)');
grid on;
title('Range vs Angle');
% Analyzing maximum height vs angle
h = 50 + (30 * sin(theta)).^2 / (2 * 9.81);
subplot(2, 2, 2);
plot(thetadeg, h, '-o'); % Plot maximum height vs angle
xlabel('Angle (degrees)');
ylabel('Max Height (m)');
grid on;
title('Max Height vs Angle');
% Analyzing time of flight vs angle
T = (2 * 30 * sin(theta)) / 9.81;
subplot(2, 2, 3);
plot(thetadeg, T, '-o'); % Plot time of flight vs angle
xlabel('Angle (degrees)');
ylabel('Time of Flight (s)');
grid on;
title('Time of Flight vs Angle');


% Define time array
t = [0:0.1:20];

% First projectile: Launch angle = pi/12
theta = pi / 12;
x = 30 * cos(theta) * t;  % Horizontal motion
y = 50 + 30 * sin(theta) .* t - 0.5 * 9.81 * t.^2;  % Vertical motion (including gravity)
p1 = plot(x, y, 'Color', [0.2, 0.6, 1], 'LineWidth', 1.5); % Light Blue color for line
grid on;
hold on;

% Second projectile: Launch angle = 5*pi/36
theta = 5 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) * t - 0.5 * 9.81 * t.^2;
p2 = plot(x, y, 'Color', [0.1, 0.9, 0.1], 'LineWidth', 1.5); % Bright Green color for line
grid on;
hold on;

% Third projectile: Launch angle = 7*pi/36
theta = 7 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) * t - 0.5 * 9.81 * t.^2;
p3 = plot(x, y, 'Color', [1, 1, 0], 'LineWidth', 1.5); % Yellow color for line
grid on;
hold on;

% Fourth projectile: Launch angle = pi/4
theta = pi / 4;
x = 30 * cos(theta) * t;
y = 50 + 30 * sin(theta) * t - 0.5 * 9.81 * t.^2;
p4 = plot(x, y, 'Color', [1, 0, 0], 'LineStyle', 'none', 'LineWidth', 1.5); % Red color for line
grid on;
hold on;

% Fifth projectile: Launch angle = 11*pi/36
theta = 11 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * cos(theta) * t - 0.5 * 9.81 * t.^2;
p5 = plot(x, y, 'Color', [0, 1, 1], 'LineStyle', 'none', 'LineWidth', 1.5); % Cyan color for line
grid on;
hold on;

% Sixth projectile: Launch angle = 13*pi/36
theta = 13 * pi / 36;
x = 30 * cos(theta) * t;
y = 50 + 30 * cos(theta) * t - 0.5 * 9.81 * t.^2;
p6 = plot(x, y, 'Color', [0, 0, 0], 'LineWidth', 1.5); % Black color for line
grid on;
hold on;

% Seventh projectile: Launch angle = 5*pi/12
theta = 5 * pi / 12;
x = 30 * cos(theta) * t;
y = 50 + 30 * cos(theta) * t - 0.5 * 9.81 * t.^2;
p7 = plot(x, y, 'Color', [0.7, 0, 0.7], 'LineStyle', 'none', 'LineWidth', 1.5); % Purple color for line
grid on;

% Set axis limits for better visualization
axis([0 150 0 100]);

% Add title and axis labels
title('Analyzing Projectile Motion');
xlabel('Horizontal Distance, x(m)');
ylabel('Vertical Height, y(m)');

% Add legend to label the different launch angles
legend([p1, p2, p3, p4, p5, p6, p7], {'15', '25', '35', '45', '55', '65', '75'});