% ------------------------ Description ------------------------ %
%                                                               %
%               Output : Temperature Map - Profiles             %
%                                                               %
% -------------------------- Content -------------------------- %

x_idx = 1:50;                                   % X-axis
lin_xi = XI(1, x_idx);
lin_eta = [3: 10: round( length(ETA)*0.5 )];    % Y-axis
vec_eta = Temp(x_idx, lin_eta);
d_vec_eta = vec_eta(2:end, :) - vec_eta(1:end-1, :);

% ----------------- T(xi, eta) ----------------- % 
Fig('Temperature Profile');
plot3( lin_xi, repmat(lin_eta*0.001, length(vec_eta), 1), vec_eta, 'k--', 'LineWidth', 1.25); grid on;
ind(1) = title('$T \, (\xi, \eta)$');
ind(2) = xlabel('$\xi$');
ind(3) = ylabel('$\eta$');
ind(4) = zlabel('$T \, (\xi, \eta)$');
ax = gca; ax.FontSize = 12; view([37 16]); 
xlim([0 0.4]); ylim([0 0.25]); zlim([0 0.225]);
set(ind, 'Interpreter', 'latex', 'fontsize', 18); clear ind;
