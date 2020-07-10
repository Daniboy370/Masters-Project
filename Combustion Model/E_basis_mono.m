function e_basis = E_basis_mono( k, n )
e_basis = [ zeros(k-1, 1);1; zeros(n-k, 1) ]';  % standard basis
