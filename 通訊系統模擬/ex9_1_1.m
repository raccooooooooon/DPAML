clear; clc;

% 設置參數
N = 1e6; % 設定傳輸的位元數
EbN0dB = 0:12; % 設定SNR範圍
EbN0 = 10.^(EbN0dB/10); % 轉換成線性比特能量信噪比
EsN0 = EbN0 * 2; % 由於QPSK的能量效率為2比特/符號，因此Es/No是Eb/No的兩倍

% 產生QPSK訊號
x = 1/sqrt(2) * (randi([0,1],2,N)*2-1) + 1j/sqrt(2) * (randi([0,1],2,N)*2-1);

% 產生Rayleigh平坦衰落通道係數
h = 1/sqrt(2) * (randn(1,N) + 1j*randn(1,N));

% 產生高斯白雜訊
No = 1; % 雜訊功率
n = sqrt(No/2) * (randn(1,N) + 1j*randn(1,N));

% 接收信號
y = h .* x + n;

% 接收端硬判定
y_hard_decision = sign(real(y)) + 1j * sign(imag(y));

% 計算位元錯誤率（BER）
BER = zeros(size(EbN0));
for i = 1:length(EbN0)
    error_bits = sum(abs(y_hard_decision - x) > 0);
    BER(i) = error_bits / (2*N);
end

% 繪製BER圖
figure;
semilogy(EbN0dB, BER, 'o-');
grid on;
xlabel('SNRb-Eas/No (dB)');
ylabel('Bit Error Rate (BER)');
title('BER over Rayleigh flat-fading channel');
legend('Simulation');
