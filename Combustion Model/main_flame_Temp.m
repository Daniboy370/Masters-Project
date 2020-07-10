% ----------------- Flame Temperature Script ------------------ %
%                                                               %
%  Output : Flame Temperture space vs. Normalized Evaporation E %
%                                                               %
% -------------------------- Content -------------------------- %

clc; clear; close all; 
set(0, 'defaultfigurecolor', [1 1 1]);
fig_loc =  [500 250 1000 500]; % Optional : open window on 2nd screen (!)
Fig     = @(str) figure('rend', 'painters', 'pos', fig_loc, 'name', str);
upload_parameters;

xi_0 = 0.001;
% Evaporation Rate
E_len = 150;        E_arr = logspace(1, 6, E_len);      len_E = length( E_arr );
% Fuel fraction
Del_i = 0:0.2:0.8;  len_Del_i = length(Del_i);
% iDSD (section)
Sec_i = 1:2:9;      len_Sec_i = length(Sec_i);  % # section

% Initialization
tmp_max = zeros(len_Del_i, len_E, len_Sec_i);

% Algorithm
Fig('Monosectional'); hold on; grid on;
for i = 1:len_Sec_i                     % Number of sections
    for j = 1:len_Del_i                 % Number of fuel fractions
        Basis = E_basis_mono( Sec_i(i), N_tot);
        Del_i(j) = min( max(Del_i(j)), Del_ub);
        delta = Basis*Del_i(j);
        tmp_max(j, :, i) = Tmax_vs_E(delta, E_arr);
        
        % OPTIONAL :: interpolate noisy calcultions due to large intervals
        tmp_max = smooth_graphs(tmp_max, E_arr, len_Del_i, len_Sec_i); 
    end
    plot3( E_arr, Sec_i(i)*ones(E_len, 1), tmp_max(1:j, :, i), 'r-', 'LineWidth', 1);
    %     plot3( E_arr, Sec_i(i)*ones(E_len, 1), eta_max(:, :, i), 'b--', 'LineWidth', 1);
end

% save data into following files :
save('tmp_Matrix.mat', 'tmp_max'); writematrix(tmp_max, 'tmp_Matrix.csv');

% ----------- Plot x-log-scale 3D Graphs ----------- %
set(gca, 'xScale', 'log'); view([-57 16]);
ind(1) = xlabel('$\bar{E}$');
ind(2) = ylabel('$d$ - section number');
ind(3) = zlabel('$T_{max}$');
% ind(2) = title('$\{ \, \eta_{max} \, , T_{max} \, \}$ vs. $\bar{E} ;$');
ind(4) = title('$ T_{max} \,$ vs. $\{ \bar{E} \ , \ \delta \}$');
ax = gca; ax.FontSize = 14;
xlim([10 1e6]); % ylim([0 0.25]);
set(ind,  'Interpreter',  'latex',  'fontsize',  18); clear ind;

%% Display the 3D combination

Fig('Monosectional'); bar3( repmat( fliplr(Del_i), 5, 1)' ); alpha(0.6);
set(gca,'XTickLabel', {'T_{max}^{(d=1)}', 'T_{max}^{(d=3)}', 'T_{max}^{(d=5)}', 'T_{max}^{(d=7)}', 'T_{max}^{(d=9)}'});
ind(1) = title('Monosectional - iDSD combination ($\delta < $  1) ');
ind(2) = zlabel('$\delta$');
ax = gca; ax.FontSize = 12; view([-44 15]);
set(ind,  'Interpreter',  'latex',  'fontsize',  18); clear ind;
