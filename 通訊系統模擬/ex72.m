% 參數設定
M = 8; % PSK 調變數
EbN0dB = -3:3:9; % SNRb (dB) 的範圍
numBits = 1e5; % 模擬的位元數量

% 計算每個 SNRb 對應的 Eb/N0
EbN0 = 10.^(EbN0dB/10);

% 產生隨機的 8-PSK 訊號
data = randi([0 M-1], 1, numBits); % 隨機產生位元
symbols = exp(1j*2*pi/M*data); % 產生 PSK 符號

% 產生高斯白雜訊
N0 = 1; % 高斯白雜訊的功率頻譜密度
noisePower = N0/2; % 雜訊功率
noise = sqrt(noisePower) * (randn(1, numBits) + 1j*randn(1, numBits)); % 產生高斯白雜訊

% 接收端接收訊號
receivedSignal = symbols + noise;

% 接收端 correlator 偵測訊號
detectedData = zeros(size(data));
for k = 1:length(EbN0dB)
    % 假設接收端已知信號相位，找出最接近的信號
    receivedPhase = angle(receivedSignal);
    detectedData = mod(round((receivedPhase + 2*pi/M) * M / (2*pi)), M);
    
    % 計算錯誤率
    errors = sum(data ~= detectedData);
    SER(k) = errors / numBits; % 符號錯誤率
    BER(k) = errors / (numBits * log2(M)); % 位元錯誤率
end

% 繪製錯誤率圖
figure;
semilogy(EbN0dB, SER, '-o');
hold on;
semilogy(EbN0dB, BER, '-x');
xlabel('SNRb (dB)');
ylabel('Error Rate');
title('Symbol Error Rate (SER) and Bit Error Rate (BER)');
legend('SER', 'BER');
grid on;

