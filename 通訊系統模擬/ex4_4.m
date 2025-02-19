% 建構 x 和 sin(x) 的資料
x = 0:0.05:(100 * 0.05);
sin_x = sin(x);

% 產生雜訊
noise = rand(size(x)) * 0.04 - 0.02; % ±0.02 的雜訊
noisy_sin_x = sin_x + noise;

% 計算 sin(x) 和 sin(x)+雜訊 的導函數
dx = 0.05;
sin_derivative = calculate_derivative(sin_x, dx);
noisy_sin_derivative = calculate_derivative(noisy_sin_x, dx);

% 計算 cos(x) 作為正確的導函數
cos_x = cos(x(1:end-1));

% 繪製 sin(x)、sin(x)+雜訊、cos(x) 以及它们的導函數
subplot(2, 1, 1);
plot(x, sin_x, 'b', x, noisy_sin_x, 'r', x(1:end-1), cos_x, 'g');
title('sin(x)、sin(x)+雜訊 和 cos(x)');
legend('sin(x)', 'sin(x)+雜訊', 'cos(x)');
xlabel('x');
ylabel('y');

subplot(2, 1, 2);
plot(x(1:end-1), sin_derivative, 'b', x(1:end-1), noisy_sin_derivative, 'r');
title('sin(x) 和 sin(x)+雜訊 的導函數');
xlabel('x');
ylabel('導數值');

% 顯示圖片
sgtitle('sin(x) 和 sin(x)+雜訊的導函數比較');
