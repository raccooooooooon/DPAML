
% 產生 1000 個標準常態分布亂數值
n = 1000;
random_values = random_normal(n, 1);

% 計算標準差
std_deviation = std(random_values);

fprintf('標準差: %.4f\n', std_deviation);

% 繪製分布的直方圖
histogram(random_values, 'Normalization', 'probability');
title('標準常態分布');
xlabel('數值');
ylabel('機率');
