function T_max = Tmax_vs_E(delta, E_Arr)
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : Spray vector vs. log-scale Evaporation rate        %
%   Output : Flame shape / contour by crossing the two regions  %
%                                                               %
% -------------------------- Content -------------------------- %

Xi_i = 0; Xi_f = 1; dXi = (Xi_f-Xi_i)/100;
Xi   = Xi_i:dXi:Xi_f;

Eta_i = 0.0; Eta_f = 0.5; dEta = 1e-3;
Eta = Eta_i:dEta:Eta_f;

for E_ind = 1:length(E_Arr)
    E = E_Arr(E_ind);
    [Delta, Psi] = Initialize_Delta_Psi(E);
    tmp_max_idx = length(f_gamma_0(Eta, delta, Delta, Psi));
    eta = Eta(tmp_max_idx);
    
    % ------------- Temperature Equation ------------- %
    % T = gamma_T - gamma
    T_max(E_ind) = f_gamma_T(Xi(1), eta, delta, Delta, Psi) - f_gamma(Xi(1), eta, delta, Delta, Psi);
end
