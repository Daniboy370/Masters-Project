function [Delta, Psi] = Initialize_Delta_Psi( E )
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : Evaporation rate                                   %
%   Output : Delta & Psi functions                              %
%                                                               %
% -------------------------- Content -------------------------- %

% Lower Diameter
d_l = [1 5 10 20 30 40 50 70 90];

% Upper Diamater
d_u = [5 10 20 30 40 50 70 90 110];

% ----------- Delta function ----------- %
Delta = 1.5*E*(3*d_u-2*d_l)./(d_u.^3-d_l.^3);

% ----------- Psi   function ----------- %
Psi = 1.5*E*d_l./(d_u.^3-d_l.^3);
Psi(1:end-1) = Psi(2:end);
Psi(end) = 0;