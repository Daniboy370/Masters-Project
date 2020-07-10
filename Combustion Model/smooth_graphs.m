function tmp_max = smooth_graphs( tmp_max, E_arr, l1, l2 )

for i = 1:l1
    for j = 1:l2
        curr_graph = tmp_max(i, :, j);
        [T_max, T_min] = deal( max(curr_graph(:)), min(curr_graph(:)) );
%         tmp_thres = ( T_min + T_max )/2;      % monosectional scenario
        thres = 0.45;
        tmp_thres = T_min + thres*(T_max-T_min);
        tmp_diff = ( T_max - T_min );
        
        if tmp_diff >= 0.005
            Tf = find( curr_graph > tmp_thres, 1);
            idx = 1:Tf;
            x1 = logspace(1, log10(E_arr(Tf)), Tf); x = x1;
            p = polyfit(x, curr_graph(idx), 3);
            y1 = polyval(p, x1);
            tmp_max(i, idx, j) = y1;
            %         semilogx( logspace(1, 6, E_len), curr_graph, 'r-', 'LineWidth', 1);
        end
    end
end
