function Xi_flame = f_gamma_0(Eta, delta, Delta, Psi)
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : Eta & Delta                                        %
%   Output : flame across Xi parameter                          %
%                                                               %
% -------------------------- Content -------------------------- %

global c eps

Xi_flame = c;

for eta_ind = 2:length(Eta)
    eta = Eta(eta_ind);
    [xi0, xi1] = deal(0, 1);
    Gamma0 = f_gamma(xi0, eta, delta, Delta, Psi);
    Gamma1 = f_gamma(xi1, eta, delta, Delta, Psi);
    if sign(Gamma0) == sign(Gamma1)
        break;
    end
    while (xi1-xi0) > eps
        xi2 = (xi0+xi1)/2;
        Gamma2 = f_gamma(xi2, eta, delta, Delta, Psi);
        if sign(Gamma0) == sign(Gamma2)
            xi0 = xi2;
            Gamma0 = Gamma2;
        elseif sign(Gamma1) == sign(Gamma2)
            xi1 = xi2;
            Gamma1 = Gamma2;
        else
            break;
        end
    end
    Xi_flame(eta_ind)  =  xi2;
end
