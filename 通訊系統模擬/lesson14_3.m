% 定義生成矩陣 G
G = [1 0 0 0 1 1 1;
     0 1 0 0 1 1 0;
     0 0 1 0 1 0 1;
     0 0 0 1 0 1 1];

% 碼字長度
n = size(G, 2);

% 訊息向量的長度
k = size(G, 1);

% 計算所有可能的訊息向量
% 有 2^k 個可能的訊息向量
all_message_vectors = dec2bin(0:2^k-1) - '0';

% 初始化碼字矩陣
all_codewords = zeros(2^k, n);

% 計算每個訊息向量對應的碼字
for i = 1:2^k
    message_vector = all_message_vectors(i, :);
    codeword = mod(message_vector * G, 2);
    all_codewords(i, :) = codeword;
end

% 轉換碼字為 BPSK 符號
bpsk_symbols = 2 * all_codewords - 1; % 0 -> -1, 1 -> +1

% 定義參數
EbN0_dB = 6; % E_b/N_0 in dB
EbN0 = 10^(EbN0_dB/10);
R = k / n; % code rate
N0 = 1 / (R * EbN0);

% 傳送所有碼字，計算位元錯誤率
num_trials = 1e5; % 模擬的次數
total_bit_errors = 0;
total_bits = num_trials * k;

for trial = 1:num_trials
    % 隨機選擇一個訊息向量
    msg_idx = randi([1, 2^k]);
    transmitted_codeword = bpsk_symbols(msg_idx, :);
    
    % 傳輸過程（加入AWGN噪聲）
    noise = sqrt(N0/2) * (randn(1, n));
    received_signal = transmitted_codeword + noise;
    
    % 使用歐氏距離進行 ML 解碼
    min_distance = inf;
    decoded_msg_idx = 1;
    
    for i = 1:2^k
        distance = norm(received_signal - bpsk_symbols(i, :))^2;
        if distance < min_distance
            min_distance = distance;
            decoded_msg_idx = i;
        end
    end
    
    % 計算位元錯誤數
    transmitted_message = all_message_vectors(msg_idx, :);
    decoded_message = all_message_vectors(decoded_msg_idx, :);
    bit_errors = sum(transmitted_message ~= decoded_message);
    total_bit_errors = total_bit_errors + bit_errors;
end

% 計算平均位元錯誤率
BER = total_bit_errors / total_bits;
disp(['Average Bit Error Rate (BER) at E_b/N_0 = 6 dB: ', num2str(BER)]);
