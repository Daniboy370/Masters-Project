% ------------------------ Description ------------------------ %
%                                                               %
%  Output : High resolution grid                                %
%                                                               %
% -------------------------- Content -------------------------- %

[Xi_i, Xi_f] = deal(0, 1); dXi = (Xi_f-Xi_i)/1e3;
Xi = Xi_i:dXi:Xi_f;
[Eta_i, Eta_f, dEta] = deal( 0.0, 0.5, 4e-5);
Eta = Eta_i:dEta:Eta_f;
