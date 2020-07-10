function e_basis = E_basis_poly( X )

global X_vars Sec_tot

e_basis = zeros(1, Sec_tot);

for i = 1:length( X_vars )
    e_basis = e_basis + [ zeros(X(i)-1, 1);1; zeros(Sec_tot-X(i), 1) ]'*X(X_vars + i);
end
