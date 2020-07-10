% ------------------------ Description ------------------------ %
%                                                               %
%   Output : Temperature map of over isotherms w.r.t sectional  %
%                                                               %
% -------------------------- Content -------------------------- %

grid_norm;  Temp = [];
Xi_Flame = f_gamma_0(Eta, delta, Delta, Psi);

% ----------- Inside liquid spray zone ----------- %
for eta_ind = 1:length(Xi_Flame)
    for xi_ind = 1:length(Xi)
        eta = Eta(eta_ind);
        xi = Xi(xi_ind);
        Gamma_Temp = f_gamma_T(xi, eta, delta, Delta, Psi);
        if xi < Xi_Flame(eta_ind)
            Gamma = f_gamma(xi, eta, delta, Delta, Psi);
            Temp(xi_ind, eta_ind) = Gamma_Temp - Gamma;
        else
            Temp(xi_ind, eta_ind) = Gamma_Temp;
        end
    end
end

% ---------- Outside liquid spray zone ----------- %
for eta_ind = length(Xi_Flame)+1:length(Eta)
    for xi_ind = 1:length(Xi)
        eta = Eta(eta_ind);
        xi = Xi(xi_ind);
        Temp(xi_ind, eta_ind) = f_gamma_T(xi, eta, delta, Delta, Psi);       
    end
end

Temp = Temp_outlut(Temp);
[XI, ETA] = meshgrid(Xi, Eta);

%% Plot the temperature map
Fig('Monosectional');
[~,  cont] = contourf(XI,  ETA,  Temp', 18, '--');
cont.LineWidth = 0.75; colorbar; colormap(jet(256)); hold on;
set(gca, 'FontSize', 13); 
ind(1) = title(['Temprature Field ; $\bar{E} = 3000$']); 
ind(2) = xlabel('$\xi$');
ind(3) = ylabel('$\eta$');
set(ind,   'Interpreter', 'latex', 'fontsize', 18); clear ind;
xlim([0 0.4]); ylim([0 0.2]);