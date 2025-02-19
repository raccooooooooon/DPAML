% Rayleigh分布的機率密度函數
p_x = @(x) 2 * x .* exp(-x.^2);

% (1) 計算CDF
cdf_rayleigh = @(x) 1 - exp(-x.^2);

% 產生 Rayleigh 隨機變數的函數
generate_rayleigh = @(num_samples) sqrt(-log(1-rand(num_samples,1)));

% (2) 統計平均值及變異數
% 平均值
mean_rayleigh = integral(@(x) x.*p_x(x), 0, Inf);
% 變異數
var_rayleigh = integral(@(x) (x-mean_rayleigh).^2.*p_x(x), 0, Inf);

fprintf('Rayleigh分佈的平均值：%.4f\n', mean_rayleigh);
fprintf('Rayleigh分佈的變異數：%.4f\n', var_rayleigh);

% (3) 產生10^6次隨機變數，繪製直方圖
num_samples = 10^6;
rayleigh_samples = generate_rayleigh(num_samples);

% 計算直方圖
edges = 0:0.01:4;
counts = histcounts(rayleigh_samples, edges, 'Normalization', 'probability');

% 繪製直方圖
figure;
bar(edges(1:end-1), counts, 'FaceColor', 'b', 'EdgeColor', 'k', 'BarWidth', 1);
hold on;

% 繪製機率密度函數
x_values = linspace(0, 4, 1000);
p_x_values = p_x(x_values);
plot(x_values, p_x_values, 'r', 'LineWidth', 2);

xlabel('隨機變數值');
ylabel('機率密度函數');
title('Rayleigh分佈的機率密度函數');

% (4) 推導Y=X^2的機率分佈，並畫出機率密度函數圖
% Y = X^2
% 推導 Y 的機率密度函數
% 對 Y 進行變數替換，求解 Y 的機率密度函數
syms y
pdf_Y = simplify(subs(p_x(sqrt(y)), y, x));
fprintf('Y=X^2的機率密度函數：');
disp(pdf_Y);

% 產生Y
rayleigh_squared_samples = rayleigh_samples.^2;

% 計算直方圖
edges_Y = 0:0.01:16;
counts_Y = histcounts(rayleigh_squared_samples, edges_Y, 'Normalization', 'probability');

% 繪製直方圖
figure;
bar(edges_Y(1:end-1), counts_Y, 'FaceColor', 'b', 'EdgeColor', 'k', 'BarWidth', 1);
hold on;

% 繪製機率密度函數
x_values_Y = linspace(0, 16, 1000);
p_x_values_Y = double(subs(pdf_Y, x, sqrt(x_values_Y)));
plot(x_values_Y, p_x_values_Y, 'r', 'LineWidth', 2);

xlabel('隨機變數值');
ylabel('機率密度函數');
title('Y=X^2的機率密度函數');

