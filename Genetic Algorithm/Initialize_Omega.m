function Omega = Initialize_Omega(Gamma_d0, Delta, Psi)
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : d_Gamma, Delta, Psi                                %
%   Output : Omega (spray)                                      %
%                                                               %
% -------------------------- Content -------------------------- %

N = length(Delta);
Sum_Omega = 0;
for i = N:-1:2
    Omega(i, i) = Gamma_d0(i) - Sum_Omega;
    for j = (i-1):-1:1
        Omega(i, j) = Psi(j)/(Delta(j)-Delta(i))*Omega(i, j+1);
    end
    Sum_Omega = sum(Omega(i:end, i-1));
end
Omega(1, 1) = Gamma_d0(1) - Sum_Omega;