function print_max_indices(Temp)

max_Temp = max(Temp(:));
[x_idx, y_idx] = find( Temp == max_Temp );

% (!) Recall that matlab return the LAST SAME value (!) %
if x_idx ~= 1
    x_idx = 1;
end

disp( ['Highest Temp : ', num2str(max_Temp)] );
disp( ['(xi_ind, eta_ind) = ', '(', num2str(x_idx), ', ' num2str(y_idx), ')']);