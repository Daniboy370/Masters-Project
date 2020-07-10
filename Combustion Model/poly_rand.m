function fraction_num = residue_func( num_of_params )

a = zeros(num_of_params, 1); b = 60;

for k = 1:num_of_params-1
    a(k) = randi([1 b], 1, 1);
    b = b - a(k);
    if b == 0 
        break
    end
end

a(num_of_params) = 100 - sum( a(1:k) );
fraction_num = a(randperm(length(a)))/100;