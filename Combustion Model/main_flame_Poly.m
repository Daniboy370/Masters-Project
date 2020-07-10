% ----------------- Polydisperse Flame Script ----------------- %
%                                                               %
%  Output : Flame Height space vs. Normalized Evaporation rate  %
%                                                               %
% -------------------------- Content -------------------------- %

clc; clear; close all; 
set(0, 'defaultfigurecolor', [1 1 1]);
fig_loc =  [500 250 1000 500]; % Optional : open window on 2nd screen (!)
Fig     = @(str) figure('rend', 'painters', 'pos', fig_loc, 'name', str);
upload_parameters;

[min_Pi, max_Pi] = deal(1, 9);
get_rand = @(m) randi([min_Pi, max_Pi], 1, m);

number_of_graphs = 10;
Base_final = zeros(number_of_graphs, N_tot);
len_Base = length(Base_final);

E_len = 150; xi_0 = 0.001;
E_arr = logspace(1, 6, 150);
eta_max = zeros(number_of_graphs, E_len); 

Fig('Polysectional'); hold on; grid on;
for i = 1:number_of_graphs                      % Number of graphs
    % --------- drawing random subset --------- %
    num_of_cols = get_rand(1);
    cols_location = get_rand( num_of_cols );
    fuel_mass_fraction = poly_rand( num_of_cols );
    
    for j = 1:num_of_cols
        Base(j, :) = E_basis_mono( cols_location(j), N_tot);
    end
    Base_i = Base .* fuel_mass_fraction;
    Base_final(i, :) = sum ( Base_i, 1 );
    clear Base Base_i;
    % ----------- Applying on basis ----------- %
    delta = Base_final(i, :)*correction_coeff;
    eta_max(i, :) = eta_vs_E(delta, E_arr, xi_0);
end
plot3( E_arr, repmat( 1:10, 150, 1), eta_max, 'b--', 'LineWidth', 1 );

% ----------- Plot x-log-scale 3D Graphs ----------- %
set(gca, 'xScale', 'log'); view([-55 15]);
ind(1) = xlabel('$\bar{E}$');
ind(2) = ylabel('$i$');
ind(3) = zlabel('$\eta_{max}$');
ind(4) = title('$\eta_{max} \,$ vs. $\{ \bar{E} \ , \ \delta \}$');
ax = gca; ax.FontSize = 14;
set(ind,  'Interpreter',  'latex',  'fontsize',  18); clear ind;

% ---- 0 [%] fluid / 100 [%] gaseous flame ---- %
eta_f0 = eta_vs_E( zeros(1, N_tot), E_arr, xi_0);
plot3( E_arr(end)*ones(1, len_Base), 1:len_Base, 0.1682*ones(1, len_Base), 'r--', 'LineWidth', 1.5 );

%% Polysectional 3D combination

Fig('Polysectional'); bar3( Base_final' ); alpha(0.6);
ind(1) = title('Polysectional - iDSD combination ( $\sum \delta_k = $  1 ) ');
ind(2) = xlabel('$\eta_{max}(i)$');
ind(3) = ylabel('$d$ - section number');
ind(4) = zlabel('$\delta$');

ax = gca; ax.FontSize = 12; view([-36 17]); pbaspect([1 1 0.5]);
set(ind,  'Interpreter',  'latex',  'fontsize',  18); clear ind;
