clear all;
SNR_dB=[0 3 6 9 12];
Nt=10^4;

Count_BER=zeros(1,length(SNR_dB));
for n=1:length(SNR_dB)
    SNR=10^(SNR_dB(n)/10);
    N0=1/SNR;
    for t=1:Nt
        %-----------------------------------
        %generate received signal
        b=floor(rand(1)*2); % one-bit data
        x = 1/sqrt(2) * (randi([0,1],2,Nt)*2-1) + 1j/sqrt(2) * (randi([0,1],2,Nt)*2-1);
        h=(randn(1)+j*randn(1))*sqrt(1/2); % Rayleigh fading channel
        w=(randn(1)+j*randn(1))*sqrt(N0/2); % AWGN r=[n1, n2, n3, n4]
        y=h*x+w;
        %-------------------------------------
        %Detection
        r=y/h;
        x_hat=sign(real(r));
        b_hat=0;
        if x_hat<0
            b_hat=1;
        end
        Count_BER(n)=Count_BER(n)+abs(b_hat-b);
    end
end
BER=Count_BER./Nt;
semilogy(SNR_dB,BER,'b-.');
legend('BER');
xlabel('SNR (dB)');
ylabel('Probability of bit errors');