function f_max = GA_func_1D( X )
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : Spray vector vs. log-scale Evaporation rate        %
%   Output : Flame shape / contour by crossing the two regions  %
%                                                               %
% -------------------------- Content -------------------------- %

global del_ub N_tot xx 

[E, Sec_i, Del_i] = deal( X(1), X(2), X(3) );
Del_i = min( max(Del_i), del_ub);
delta = E_basis_mono( Sec_i, N_tot)*Del_i;        % Section Number
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
