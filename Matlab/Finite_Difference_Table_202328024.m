% Data: Position and Temperature
x = [0, 5, 10, 15, 20, 25];   % Position in cm
T = [600, 570, 530, 480, 420, 350];  % Temperature in °C

% 1. Construct Forward and Backward Finite Difference Tables

% Forward differences
n = length(x);  % Number of data points
forward_diff = zeros(n, n);  % Initialize forward difference table
forward_diff(:,1) = T';  % First column is the temperature data

for j = 2:n
    for i = 1:n-j+1
        forward_diff(i,j) = forward_diff(i+1,j-1) - forward_diff(i,j-1);
    end
end

% Backward differences
backward_diff = zeros(n, n);  % Initialize backward difference table
backward_diff(:,1) = T';  % First column is the temperature data

for j = 2:n
    for i = n:-1:j
        backward_diff(i,j) = backward_diff(i-1,j-1) - backward_diff(i,j-1);
    end
end

% Display the tables
disp('Forward Difference Table:');
disp(forward_diff);
disp('Backward Difference Table:');
disp(backward_diff);

% 2. Use Newton's Forward and Backward Difference Formulas to Calculate Gradients

% (a) Initial temperature gradient (dT/dx) at x = 0 cm (using Forward difference)
dT_dx_0 = forward_diff(1,2) / (x(2) - x(1));  % Using forward difference formula
disp(['Initial Temperature Gradient at x = 0 cm: ', num2str(dT_dx_0), ' °C/cm']);

% (b) Temperature gradient at x = 15 cm (using Backward difference)
dT_dx_15 = backward_diff(4,2) / (x(5) - x(4));  % Using backward difference formula
disp(['Temperature Gradient at x = 15 cm: ', num2str(dT_dx_15), ' °C/cm']);

% 3. Plot the Temperature Gradient (dT/dx) along the rod length

% Calculate the temperature gradient at each point using forward differences
gradient_forward = diff(T) ./ diff(x);  % Forward gradient (dT/dx)

% Create a vector for positions of the gradients
x_gradient = x(1:end-1) + diff(x)/2;  % Midpoints for gradient plotting

% Plot the temperature gradient
figure;
plot(x_gradient, gradient_forward, '-o', 'LineWidth', 2);
xlabel('Position (x) [cm]');
ylabel('Temperature Gradient (dT/dx) [°C/cm]');
title('Temperature Gradient along the Nuclear Fuel Rod');
grid on;