function Flame_Height = eta_max_vs_E(delta, E_Arr, xi)
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : Spray vector vs. log-scale Evaporation rate        %
%   Output : Flame shape / contour by crossing the two regions  %
%                                                               %
% -------------------------- Content -------------------------- %

global N_tot

for E_ind = 1:length(E_Arr)
    E = E_Arr(E_ind);
    [Delta, Psi] = Initialize_Delta_Psi(E); %[1xN]
    Delta = Delta(1:N_tot); Psi = Psi(1:N_tot);

    [eta0, eta1] = deal(0, 100);
    Gamma0 = f_gamma(xi, eta0, delta, Delta, Psi);
    Gamma1 = f_gamma(xi, eta1, delta, Delta, Psi);
    if sign(Gamma0) == sign(Gamma1)
        break;
    end
    while (eta1-eta0)>1e-5
        eta2 = (eta0+eta1)/2;
        Gamma2 = f_gamma(xi, eta2, delta, Delta, Psi);
        if sign(Gamma0) == sign(Gamma2)
            eta0 = eta2;
            Gamma0 = Gamma2;
        elseif sign(Gamma1) == sign(Gamma2)
            eta1 = eta2;
            Gamma1 = Gamma2;
        else
            eta2 = (~sign(Gamma0))*eta0+(~sign(Gamma1))*eta1+(~sign(Gamma2))*eta2;
            break;
        end
    end
    Flame_Height(E_ind) = eta2;
end