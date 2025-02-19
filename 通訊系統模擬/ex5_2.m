% (1) 计算 Rayleigh 分布的累积分布函数 (CDF)
% CDF 的表达式为 F(x) = 1 - exp(-x^2)
% 因为 p(x) = 2*x*exp(-x^2)，所以积分 p(x) 得到 CDF
% Rayleigh 分布的 CDF 为 F(x) = 1 - exp(-x^2)

% (2) 统计随机变量的平均值和方差
% Rayleigh 分布的平均值为 sqrt(pi/2)/2，方差为 (4-pi)/2

% (3) 生成 Rayleigh 随机变量并绘制直方图
% 使用逆变换法产生 Rayleigh 随机变量
% 首先生成均匀分布的随机数，然后通过 Rayleigh 分布的逆函数得到 Rayleigh 随机变量
% 然后绘制直方图，并与理论概率密度函数进行比较

% (4) 推导 Y=W^2 的概率分布
% 由于 Y=W^2，我们需要通过变量变换来求 Y 的概率密度函数
% 首先，我们求 Y 的累积分布函数，然后对其求导得到概率密度函数

% (1) 计算 Rayleigh 分布的累积分布函数 (CDF)
x_values = 0:0.01:4;
CDF = 1 - exp(-x_values.^2);

% (2) 计算 Rayleigh 分布的平均值和方差
mean_W = sqrt(pi/2)/2;
var_W = (4-pi)/2;

% (3) 生成 Rayleigh 随机变量并绘制直方图
num_samples = 10^6;
uniform_samples = rand(num_samples, 1);
rayleigh_samples = sqrt(-log(1-uniform_samples));

% 绘制直方图
figure;
histogram(rayleigh_samples(rayleigh_samples<=4), 'Normalization', 'probability', 'BinWidth', 0.01);
hold on;
plot(x_values, 2*x_values.*exp(-x_values.^2), 'r', 'LineWidth', 2);
xlabel('随机变量值');
ylabel('概率密度');
title('Rayleigh 分布随机变量的概率密度函数');
legend('直方图', '理论概率密度函数');

% (4) 推导 Y=W^2 的概率分布
% 设 Y=W^2，求 Y 的累积分布函数
% F_Y(y) = P(Y <= y) = P(W^2 <= y) = P(W <= sqrt(y))
% F_Y(y) = F_W(sqrt(y)) = 1 - exp(-y)

% 对 F_Y(y) 求导得到概率密度函数
% f_Y(y) = d/dy [1 - exp(-y)] = exp(-y)
% 也就是说 Y 的概率密度函数为指数分布

% 生成 Y 随机变量并绘制直方图
rayleigh_squared_samples = rayleigh_samples.^2;

% 绘制 Y 的直方图
figure;
histogram(rayleigh_squared_samples(rayleigh_squared_samples<=16), 'Normalization', 'probability', 'BinWidth', 0.01);
hold on;
plot(x_values, exp(-x_values), 'r', 'LineWidth', 2);
xlabel('随机变量值');
ylabel('概率密度');
title('Y=W^2 的概率密度函数');
legend('直方图', '理论概率密度函数');

