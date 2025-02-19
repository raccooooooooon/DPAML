
% 建構 x 和 sin(x) 的資料
x = 0:0.05:(100 * 0.05);
sin_x = sin(x);

% 計算 sin(x) 的導函數
dx = 0.05;
sin_derivative = calculate_derivative(sin_x, dx);

% 計算 cos(x) 作為正確的導函數
cos_x = cos(x(1:end-1));

% 繪製 sin(x) 和 cos(x) 以及計算出來的導函數
subplot(2, 1, 1);
plot(x, sin_x, 'b', x(1:end-1), cos_x, 'r');
title('sin(x) 和 cos(x)');
legend('sin(x)', 'cos(x)');
xlabel('x');
ylabel('y');

subplot(2, 1, 2);
plot(x(1:end-1), sin_derivative, 'g');
title('sin(x) 的導函數');
xlabel('x');
ylabel('導數值');

% 顯示圖片
sgtitle('sin(x) 和其導函數的比較');

