% ------------------------ Description ------------------------ %
%                                                               %
%     Output : Optimization process of the combustion model     %
%                                                               %
% -------------------------- Content -------------------------- %

clc; close all; clear; upload_parameters;
set(0, 'defaultfigurecolor', [1 1 1]);

fig_loc = [2300 250 800 600]; % NOTE : window opening on 2nd screen(!)
Fig     = @(str) figure('rend', 'painters', 'pos', fig_loc, 'name', str);

% ------------- GA implementation -------------- %
global E Del_i d_1 d_9 del_lb del_ub n_vars Sec_tot X_vars

% ------ Assuming the following initial condition ------  %
Sec_tot = 9; Del_i = 0.7;
E_arr = [500 1500 5000 10000 20000 50000]; len_E = length(E_arr);

max_vars = 6;
for v_i = 1:max_vars
    % -------------- External :: variables -------------- %
    X_vars = v_i;                                 % Number of variables
    [A  ,   b] = deal([zeros(1, X_vars), ones(1, X_vars)], Del_i);      % in-equality constrain
    lb = [d_1*ones(1, X_vars), del_lb*ones(1, X_vars)];
    ub = [d_9*ones(1, X_vars), del_ub*ones(1, X_vars)];
    n_vars = 2*X_vars; Xs = zeros(len_E, n_vars);
    Fx = zeros(len_E, 1); Time_i = Fx;
    
    % -------------- Internal :: Optimize --------------- %
    for E_i = 1:len_E
        rng default                                       % For reproducibility
        %     b = [E_arr(E_i) -E_arr(E_i) Del_i -Del_i];  % <==> constant E, delta
        tic; E = E_arr(E_i);
        [Xs(E_i, :), Fx(E_i), ~, Output] = ...
            ga(@GA_func_9D, n_vars, A, b, [], [], lb, ub, [], 1:X_vars);
        [Xs(E_i, 1:X_vars), key_order] = sort( Xs(E_i, 1:X_vars), 2 ); % sort ascending
        % ---------------- Post process ----------------- %
        Xs(E_i, X_vars+1:end) = Xs(E_i, X_vars + key_order);
        Xs(:, X_vars+1:end) = round( Xs(:, X_vars+1:end), 4);
        Fx(E_i) = -Fx(E_i);                     % arg_max <==> -arg_min
        Time_i(E_i) = round(toc, 2)
    end
    T = table( E_arr', Xs(:, 1:X_vars), Xs(:, X_vars+1:end), round(Fx, 4), Time_i, 'VariableNames', ...
        {'Ē', 'Sections', 'delta', 'eta_max', 'Time [s]'})
    writetable(T, ['Table_' num2str(v_i)])
end
