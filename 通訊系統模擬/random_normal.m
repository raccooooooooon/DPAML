function result = random_normal(n, m)
    % 生成標準常態分布亂數陣列
    result = zeros(n, m);
    for i = 1:n
        for j = 1:m
            x1 = rand() * 2 - 1;
            x2 = rand() * 2 - 1;
            while x1^2 + x2^2 >= 1
                x1 = rand() * 2 - 1;
                x2 = rand() * 2 - 1;
            end
            r = x1^2 + x2^2;
            y1 = sqrt(-2 * log(r) / r) * x1;
            y2 = sqrt(-2 * log(r) / r) * x2;
            result(i, j) = y1;
        end
    end
end
