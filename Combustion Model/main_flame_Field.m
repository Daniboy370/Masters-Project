% ------------------------ Description ------------------------ %
%                                                               %
%   Output : Temperature map of over isotherms w.r.t sectional  %
%                                                               %
% -------------------------- Content -------------------------- %

clc; clear; close all; 
set(0, 'defaultfigurecolor', [1 1 1]);
fig_loc =  [500 250 1000 500]; % Optional : open window on 2nd screen (!)
Fig     = @(str) figure('rend', 'painters', 'pos', fig_loc, 'name', str);
upload_parameters; E = 3e3;

% -------------- Finding the flame shape -------------- %
N_mono = 6; fuel_mass_fraction = 0.5;                   % Typical Values
delta = E_basis_mono(N_mono, N_tot)*fuel_mass_fraction; % Section Number;
Temperature_Field; hold on;

% -------------- Finding the flame shape -------------- %
grid_densed; flame_shape = f_gamma_0(Eta, delta, Delta, Psi);
plot( flame_shape, Eta(1:length(flame_shape)), 'k--', 'LineWidth', 2.25);
Temperature_Map; print_max_indices( Temp );
