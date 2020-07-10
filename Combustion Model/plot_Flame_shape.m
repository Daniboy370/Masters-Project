function Xi_Flame = plot_Flame_shape(Eta, c, V, delta, Delta, Psi, Pe, eps1, show_flame)

Xi_Flame = Find_Flame_Shape(Eta,c,V,delta,Delta,Psi,Pe,eps1);

if (show_flame)
    figure; plot(Xi_Flame,Eta(1:length(Xi_Flame)));
    grid on; set(gca,'FontSize',12);
    title('Flame Shape'); xlabel('\xi'); ylabel('\eta');
end