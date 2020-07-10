function Temp = Temp_outlut(Temp)

% (!) FOR VALIDATION PURPOSE ONLY (!)
% (!) FOR VALIDATION PURPOSE ONLY (!)

tmp_max_1 = max( Temp(:, 2) )*.9;

if ( max( Temp(:, 1) ) >= tmp_max_1 )
    [~, c_ind_1] = max( Temp(:, 1) );
    Temp(c_ind_1, 1) = tmp_max_1;
end

tmp_ind = find( Temp(:, 1) > tmp_max_1 );
Temp( find( Temp(:, 1) > tmp_max_1 ), 1 ) = tmp_max_1*.9;
