% ------------------------ Description ------------------------ %
%                                                               %
%  Output : Normal resolution grid                              %
%                                                               %
% -------------------------- Content -------------------------- %

Xi_i = 0; Xi_f = 1; dXi = (Xi_f-Xi_i)/100;
Xi   = Xi_i:dXi:Xi_f;

Eta_i = 0.0; Eta_f = 0.5; dEta = 1e-3;
Eta = Eta_i:dEta:Eta_f;

[Delta, Psi] = Initialize_Delta_Psi(E);
Delta = Delta(1:N_tot); Psi = Psi(1:N_tot);