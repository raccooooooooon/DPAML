
% 主程序
rolls = 100000; % 掷骰子次数
results = zeros(1, rolls);

for i = 1:rolls
    results(i) = dice();
end

% 绘制直方图
histogram(results, 'Normalization', 'probability');
title('Dice Roll Distribution');
xlabel('Dice Face');
ylabel('Probability');
