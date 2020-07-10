% ------------------- Monosectional Script -------------------- %
%                                                               %
%  Output : Flame height space vs. Normalized Evaporation       %
%                                                               %
% -------------------------- Content -------------------------- %

clc; clear; close all; 
set(0, 'defaultfigurecolor', [1 1 1]);
fig_loc =  [500 250 1000 500]; % Optional : open window on 2nd screen (!)
Fig     = @(str) figure('rend', 'painters', 'pos', fig_loc, 'name', str);
upload_parameters;

xi_0 = 0.001;
E_arr = logspace(1, 6, 150);    len_E = length( E_arr );
Del_i = 0.2:0.2:1.00;        len_Del_i = length(Del_i);  % fuel fraction
Sec_i = 1:2:9;              len_Sec_i = length(Sec_i);  % # section 
eta_max = zeros(len_Del_i, len_E, len_Sec_i);

Fig('Monosectional'); hold on; grid on;
for i = 1:len_Sec_i                     % Number of sections
    for j = 1:len_Del_i                 % Number of fuel fractions
        Basis = E_basis_mono( Sec_i(i), N_tot);
        Del_i(j) = min( max(Del_i(j)), Del_ub);
        delta = Basis*Del_i(j);
        eta_max(j, :, i) = eta_vs_E(delta, E_arr, xi_0);
    end
    plot3( E_arr, Sec_i(i)*ones(150, 1), eta_max(:, :, i), 'b--', 'LineWidth', 1 );
end

% ----------- Plot x-log-scale 3D Graphs ----------- %
set(gca, 'xScale', 'log'); view([-50 10]);
ind(1) = xlabel('$\bar{E}$');
ind(2) = ylabel('$d$ - section number'); %$\delta_k$ - [$\frac{ m^{(k)}_{gas} }{ m^{(k)}_{TOT} }$]');
ind(3) = zlabel('$\eta_{max}$');
ind(4) = title('$\eta_{max} \,$ vs. $\{ \bar{E} \ , \ \delta \}$');
ax = gca; ax.FontSize = 14;
set(ind,  'Interpreter',  'latex',  'fontsize',  18); clear ind;

% ---- 0 [%] fluid / 100 [%] gaseous flame ---- %
eta_f0 = eta_vs_E( zeros(1, N_tot), E_arr, xi_0);
plot3( E_arr(end)*ones(1, len_Sec_i), Sec_i, 0.1682*ones(1, len_Sec_i), 'r--', 'LineWidth', 1.5 );

%% Display the 3D combination

Fig('Monosectional'); bar3( repmat( fliplr(Del_i), 5, 1)' ); alpha(0.6);
set(gca,'XTickLabel', {'\eta_{max}^{(d=1)}', '\eta_{max}^{(d=3)}', '\eta_{max}^{(d=5)}', '\eta_{max}^{(d=7)}', '\eta_{max}^{(d=9)}'});
ind(1) = title('Monosectional - iDSD combination ($\delta < $  1) ');
ind(2) = zlabel('$\delta$');
ax = gca; ax.FontSize = 12; view([-44 15]);
set(ind,  'Interpreter',  'latex',  'fontsize',  18); clear ind;
