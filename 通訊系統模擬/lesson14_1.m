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

% 顯示所有可能的碼字
disp('所有可能的碼字為：');
disp(all_codewords);
