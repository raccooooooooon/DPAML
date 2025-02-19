% OFDM signal with CP and QPSK modulation
% # of subcarriers=16, # of CP=4
% Length of channel = 3
clear all;
SNR_dB=[-3 0 3 6 9]; %以分貝（dB）為單位的信噪比（Signal-to-Noise Ratio）陣列
Nt=10^4; %模擬的試驗次數
Nc=64; % 子載波數量
Lcp=15; % 循環前綴（CP）的長度
Nb=2; % 每個符號的位元數
Lch=5; % 通道的長度

Count_BER=zeros(1,length(SNR_dB)); %初始化錯誤計數器

%對於每個信噪比（SNR）值，計算雜訊功率（N0）
for n=1:length(SNR_dB)
 SNR=10^(SNR_dB(n)/10);
 N0=1/(Nc*SNR);
 for t=1:Nt
 %-----------------------------------
 % 生成隨機二進位數據
 b=floor(rand(1,Nc*Nb)*2); 
 X_f=zeros(Nc,1);
 for ns=1:Nc
 X_f(ns)=j*(-1)^b(2*ns-1)+(-1)^b(2*ns); %將每個二進位數據對映射到 QPSK 符號
 end
 x_t = ifft(X_f); %對生成的 QPSK 符號執行傅立葉反變換（IFFT）
 % Insert CP
 x_t_CP=[x_t(Nc-Lcp+1:Nc); x_t]; %將一個 OFDM 符號的尾部複製並添加到該符號的開頭
 %-----------------------------------
 %生成通道系數
 h=zeros(Lch,1);
 for nch=1:Lch
 var_ch=(1-exp(-1))*exp(-nch+1)/(1-exp(-Lch));
 h(nch)=(randn(1)+j*randn(1))*sqrt(var_ch/2);
 end
 %模擬接收信號
 y_t_CP=conv(x_t_CP,h)+(randn(Nc+Lcp+Lch-1,1)+j*randn(Nc+Lcp+Lch-1,1))*sqrt(N0/2);
 %-------------------------------------
 %在接收端，執行均衡和檢測步驟
 %remove CP:
 y_t=y_t_CP(Lcp+1:Lcp+Nc);
 %Equalization and detection :
 Y_f=fft(y_t);
 H=fft(h, Nc); % Freq. domain channel
 Z_f=inv(diag(H))*Y_f;
 X_f_hat=sign(real(Z_f))+j.*sign(imag(Z_f));
 b_hat=zeros(1,Nc*Nb);
 for ns=1:Nc
 if imag(X_f_hat(ns))<0
 b_hat(2*ns-1)=1;
 end
 if real(X_f_hat(ns))<0
 b_hat(2*ns)=1;
 end
 end
 %計算位元錯誤的數量
 Count_BER(n)=Count_BER(n)+sum(abs(b_hat-b));
 end
end
%將每個 SNR 下的 BER 計數除以總的二進位數據量，以獲得 BER
BER=Count_BER./(Nb*Nc*Nt);
semilogy(SNR_dB,BER);
xlabel('SNR (dB)');
ylabel('Probability of errors');