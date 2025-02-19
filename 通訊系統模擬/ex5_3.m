% 第一區號碼範圍
numbers_zone1 = 1:38;

% 第二區號碼範圍
numbers_zone2 = 1:8;

% 初始化威力彩開獎號碼
power_lottery_numbers = zeros(1, 7);

% 隨機產生第一區的六個號碼
for i = 1:6
    % 從第一區號碼中隨機選擇一個號碼
    index = randi(length(numbers_zone1));
    power_lottery_numbers(i) = numbers_zone1(index);
    
    % 移除已選擇的號碼
    numbers_zone1(index) = [];
end

% 隨機產生第二區的一個號碼
power_lottery_numbers(7) = numbers_zone2(randi(length(numbers_zone2)));

% 顯示威力彩開獎號碼
disp('威力彩開獎號碼:');
disp(power_lottery_numbers);
