%Code for Calculating Mass Defect, Binding Energy, and BE/A Curve

% Conversion factor: 1 atomic mass unit (amu) to MeV
amu_to_MeV = 931.5; 

% Given masses in atomic mass units (amu)
m_U235 = 235.043924;   % Mass of Uranium-235
m_n = 1.008665;        % Mass of a neutron
m_Rb93 = 92.91699;     % Mass of Rubidium-93
m_Cs140 = 139.90910;   % Mass of Cesium-140
m_n_products = 3 * m_n; % Total mass of 3 emitted neutrons

% Compute total mass of reactants and products
mass_reactants = m_U235 + m_n; % Mass of Uranium-235 and one neutron
mass_products = m_Rb93 + m_Cs140 + m_n_products; % Mass of fission products and neutrons

% Calculate mass defect (Δm)
mass_defect = mass_reactants - mass_products;

% Compute binding energy (B.E.) in MeV
binding_energy = mass_defect * amu_to_MeV;

% Calculate binding energy per nucleon (B.E./A)
A = 235; % Total number of nucleons in Uranium-235
binding_energy_per_nucleon = binding_energy / A;

% Display results
disp('Mass defect (amu):');
disp(mass_defect);
disp('Binding energy (MeV):');
disp(binding_energy);
disp('Binding energy per nucleon (MeV):');
disp(binding_energy_per_nucleon);

% Generate and plot the Binding Energy per Nucleon (B.E./A) Curve
atomic_numbers = 1:240; % Range of mass numbers for hypothetical nuclides
binding_energies = 15.75 .* atomic_numbers - 17.8 * (atomic_numbers.^(2/3)); % Binding energy model
binding_energies = binding_energies ./ atomic_numbers; % Normalize to calculate B.E./A
