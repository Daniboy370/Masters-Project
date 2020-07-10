function f_max = GA_func_9D( X )
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : Spray vector vs. log-scale Evaporation rate        %
%   Output : Flame shape / contour by crossing the two regions  %
%                                                               %
% -------------------------- Content -------------------------- %

global E xx

if isempty(find(hist(X,unique(X))>1))
    delta = E_basis_poly( X );                  % State vector
    [Delta, Psi] = Initialize_Delta_Psi(E);
    [eta0, eta1] = deal(0, 100);
    Gamma0 = f_gamma(xx, eta0, delta, Delta, Psi);
    Gamma1 = f_gamma(xx, eta1, delta, Delta, Psi);
    if sign(Gamma0) == sign(Gamma1)
        return;
    end
    while (eta1-eta0)>1e-5
        eta2 = (eta0+eta1)/2;
        Gamma2 = f_gamma(xx, eta2, delta, Delta, Psi);
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
    f_max = - (eta2); % :: arg_max <==> arg_min
else
    f_max = 0;
end