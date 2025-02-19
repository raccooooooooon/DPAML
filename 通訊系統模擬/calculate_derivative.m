function derivative = calculate_derivative(vect, dx)
    % 求取樣函數的導函數
    if dx <= 0
        error('Error: dx must be greater than 0.');
    end
    
    num_samples = length(vect);
    derivative = zeros(1, num_samples - 1);
    
    for i = 1:num_samples - 1
        derivative(i) = (vect(i + 1) - vect(i)) / dx;
    end
end
