function Gamma = f_gamma(xi, eta, delta, Delta, Psi)
% ------------------------ Description ------------------------ %
%                                                               %
%   Input  : initial teperature parameters                      %
%   Output : gamma parameter                                    %
%                                                               %
% -------------------------- Content -------------------------- %

global c N_tot V Pe

Gamma_d0_xi = delta;
Omega  =  Initialize_Omega(Gamma_d0_xi, Delta, Psi);

for j = 1:N_tot
    Gamma_d_xi(j) = 0;
    for i = j:N_tot
        Gamma_d_xi(j)  =  Gamma_d_xi(j) + Omega(i, j)*exp(-Delta(i)*eta);
    end
end
H = zeros(1, N_tot);
for i = 1:N_tot
    for j = 1:i
        H(i)  =  H(i) + Omega(i, j);
    end
end
K0  =  2*c*H(1, :);
b0 = -Delta./(Delta+(Delta/Pe).^2).*K0;
M = 150; % Fouriur highest index
for m = 1:M
    Km(m, :) =  2/pi*sin(m*pi*c)/m*H(1, :); % Km = Km(m, i)
    bn(m, :) = -Delta./(Delta+(Delta/Pe).^2-(m*pi)^2).*Km(m, :); % bn = bn(m, i)
end
Gamma_p  =  0;
for i = 1:N_tot
    Bn  =  0;
    for n = 1:M
        Bn = Bn + bn(n, i)*cos(n*pi*xi);
    end
    Gamma_p = Gamma_p + (b0(i)/2 + Bn)*exp(-Delta(i)*eta);
end
Gamma_h = sum(.5*K0-c*delta) + c*(1+V)-V;
for n = 1:M
    qn(n) = Pe^2/2*(1-sqrt(1+4*n^2*pi^2/Pe^2)); % qn = qn(n)
    C2(n) = 2*(1+V)*sin(n*pi*c) - (sum(bn(n, :).*(1+Delta/Pe^2)*n*pi+2*delta*sin(n*pi*c)));
    C2(n) = C2(n)/n/pi/(1-qn(n)/Pe^2);
    Gamma_h = Gamma_h + C2(n)*cos(n*pi*xi)*exp(qn(n)*eta);
end
Gamma = Gamma_h + Gamma_p;