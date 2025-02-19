function medianFilter(filename, n)

    % 读取数据
    dataset_name = input('請輸入數據集名稱（例如 input3.dat）：', 's');
    data = load(dataset_name); 
    
    n = input('请输入滤波器的平均样本数：');

    
    % 执行中位值滤波
    filtered_data = medfilt1(data, n);
    
    % 绘制原始数据和滤波后的数据
    plot(data, 'b', 'LineWidth', 1.5);
    hold on;
    plot(filtered_data, 'r', 'LineWidth', 1.5);
    hold off;
    
    % 添加图例和标签
    legend('原始数据', '滤波后的数据');
    title('中位值滤波');
    xlabel('数据点');
    ylabel('数值');
    grid on;

end
