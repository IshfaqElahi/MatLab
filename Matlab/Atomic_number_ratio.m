%% Load Data
% Load data from the provided CSV files into MATLAB
stable_data = readtable('/MATLAB Drive/all_stable - all_stable.csv'); % Stable nuclides data
stable2_data = readtable('/MATLAB Drive/all_stable2 - all_stable2.csv'); % Additional stable data with averages
unstable_data = readtable('/MATLAB Drive/all_unstable - all_unstable.csv'); % Unstable nuclides data

%% Define Column Names
% Assign column names for better code readability and reusability
neutron_column_stable = 'N'; % Column name for the number of neutrons
atomic_number_column = 'Z'; % Column name for atomic number (protons)
nat_abundance_column = 'Nat_abundance'; % Column name for natural abundance
neutron_avg_column = 'N_avg'; % Column name for average neutrons in stable2 data

%% Plot NZ1: Segre Chart of Known Nuclides
% Create a Segre chart displaying stable and unstable nuclides
figure;

% Plot stable nuclides in red squares
scatter(stable_data.(neutron_column_stable), stable_data.(atomic_number_column), 50, ...
    's', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');
hold on;

% Plot neutron-rich unstable nuclides (N > Z) in cyan triangles
neutron_rich = unstable_data(unstable_data.(neutron_column_stable) > unstable_data.(atomic_number_column), :);
scatter(neutron_rich.(neutron_column_stable), neutron_rich.(atomic_number_column), 50, ...
    '^', 'MarkerFaceColor', 'c', 'MarkerEdgeColor', 'w');

% Plot proton-rich unstable nuclides (N < Z) in magenta inverted triangles
proton_rich = unstable_data(unstable_data.(neutron_column_stable) < unstable_data.(atomic_number_column), :);
scatter(proton_rich.(neutron_column_stable), proton_rich.(atomic_number_column), 50, ...
    'v', 'MarkerFaceColor', 'm', 'MarkerEdgeColor', 'w');

% Plot symmetric radioactive isotopes (N = Z) as white circles
symmetric = unstable_data(unstable_data.(neutron_column_stable) == unstable_data.(atomic_number_column), :);
scatter(symmetric.(neutron_column_stable), symmetric.(atomic_number_column), 50, ...
    'o', 'MarkerFaceColor', 'w', 'MarkerEdgeColor', 'r');

% Add N/Z = 1 reference line
n_vals = 0:max([stable_data.(neutron_column_stable); unstable_data.(neutron_column_stable)]);
plot(n_vals, n_vals, 'g--', 'LineWidth', 1.75);

% Add titles, labels, and legend for NZ1
title('Segre Chart of Known Nuclides');
xlabel('Number of Neutrons (N)');
ylabel('Atomic Number (Z)');
grid on;
legend('Stable nuclides', 'Neutron-rich nuclides', 'Proton-rich nuclides', 'Symmetric RIs', 'N/Z = 1', 'Location', 'best');
hold off;

%% Average N/Z Calculation
% Calculate the average N/Z ratio for stable2 data
avg_NZ = mean(stable2_data.(neutron_avg_column) ./ stable2_data.(atomic_number_column));

% Determine the range of Z where N/Z is within 10% of 1
within_range = stable2_data( ...
    (stable2_data.(neutron_avg_column) ./ stable2_data.(atomic_number_column)) >= 0.9 & ...
    (stable2_data.(neutron_avg_column) ./ stable2_data.(atomic_number_column)) <= 1.1, :);
range_Z = [min(within_range.(atomic_number_column)), max(within_range.(atomic_number_column))];

% Find the maximum average N/Z ratio
max_NZ = max(stable2_data.(neutron_avg_column) ./ stable2_data.(atomic_number_column));

% Display average N/Z calculations in the Command Window
disp(['Average N/Z: ', num2str(avg_NZ)]);
disp(['Range where N/Z is within 10% of 1: Z = ', num2str(range_Z(1)), ' to Z = ', num2str(range_Z(2))]);
disp(['Maximum N/Z ratio: ', num2str(max_NZ)]);

%% Add Max Average N/Z Line to NZ1
% Plot a line corresponding to the maximum average N/Z ratio on the Segre chart
hold on;
plot(n_vals, n_vals * max_NZ, 'b-.', 'LineWidth', 1.75);
hold off;

%% Plot NZ2: N/Z vs. Z
% Create a plot showing the N/Z ratio against the atomic number Z
figure;

% Plot N/Z without considering natural abundance
plot(stable2_data.(atomic_number_column), stable2_data.(neutron_avg_column) ./ stable2_data.(atomic_number_column), ...
    'r-', 'LineWidth', 1.5);
hold on;

% Plot N/Z considering natural abundance
weighted_NZ = stable2_data.N_avg_weighted_by_abundance ./ stable2_data.(atomic_number_column);
plot(stable2_data.(atomic_number_column), weighted_NZ, ...
    'b--', 'LineWidth', 1.5);

% Customize line style for N/Z without abundance
set(findobj(gca, 'Type', 'line', 'Color', 'r'), 'LineStyle', '-.');

% Add titles, labels, and legend for NZ2
title('N/Z vs Z (Step 6 & 7)');
xlabel('Atomic Number (Z)');
ylabel('N/Z Ratio');
grid on;
legend('N/Z (w/o abundance)', 'N/Z (w/ abundance)', 'Location', 'best');
hold off;