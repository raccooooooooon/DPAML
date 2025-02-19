clear; clc;

M = 8; % PSK 調製的符號數
EbN0dB = [-3 0 3 6 9]; % 不同的信噪比(dB)
N = 10^6; % 要模擬的符號數量

% 符號映射表
constellation = exp(1j*(0:M-1)*2*pi/M);

% 平均符號能量
Es = sum(abs(constellation).^2)/M;

for k = 1:length(EbN0dB)
    % 計算信噪比
    EbN0 = 10^(EbN0dB(k)/10);
    N0 = Es/EbN0;
    
    % 產生隨機符號
    data = randi([0 M-1], 1, N);
    symbols = constellation(data+1); % 符號映射
    
    % 加入高斯白噪聲
    noise = sqrt(N0/2)*(randn(1, N) + 1j*randn(1, N));
    received_symbols = symbols + noise;
    
    % 接收端 correlator
    detected_symbols = zeros(1, N);
    for i = 1:N
        % 每個符號與所有可能的參考符號計算距離
        distances = abs(received_symbols(i) - constellation);
        [~, idx] = min(distances);
        detected_symbols(i) = constellation(idx);
    end
    
    % 計算 SER
    errors = sum(data ~= mod(round(angle(detected_symbols)*M/(2*pi)), M));
    SER(k) = errors/N;
    
    % 將接收到的符號映射為二進制位
    detected_data = mod(round(angle(detected_symbols)*M/(2*pi)), M);
    % 計算 BER
    BER(k) = sum(data ~= detected_data)/N;
end

% 繪製 SER 和 BER 曲線
figure;
semilogy(EbN0dB, SER, '-o');
hold on;
semilogy(EbN0dB, BER, '-r');
grid on;
legend('SER', 'BER');
xlabel('Eb/N0 (dB)');
ylabel('Error Rate');
title('SER and BER of 8-PSK in AWGN Channel');

