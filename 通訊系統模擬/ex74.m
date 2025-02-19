clear all;
SNR_dB=[-6 -3 0 3 6];
N=10^6;
Count_SER=zeros(1,length(SNR_dB));
Count_BER=zeros(1,length(SNR_dB));
for n=1:length(SNR_dB)
    SNR=10^(SNR_dB(n)/10);
    N0=1/(2*SNR);
    for t=1:N
        %-----------------------------------
        %generate received signal
        s=floor(rand(1)*8); % symbol={0, 1,2,3}
        phi=(pi/4)+s*(pi/4);
        x=exp(j*phi);
        b=zeros(1,3); % two-bit data
        b(1)=(imag(x)<0);
        b(2)=(real(x)<0);
        b(3)=mod(s,2);
        w=(randn(1)+j*randn(1))*sqrt(N0/2);
        y=x+w; % 接收訊號
        %-------------------------------------
        %Detection
        if angle(y)>=0
            if angle(y) < pi/4
                s_hat = 0;
                b_hat = [0, 0, 0];
            elseif angle(y) < pi/2
                s_hat = 1;
                b_hat = [0, 0, 1];
            elseif angle(y) < 3*pi/4
                s_hat = 2;
                b_hat = [0, 1, 1];
            elseif angle(y) < 7*pi/8
                s_hat = 3;
                b_hat = [0, 1, 0];
            else
                s_hat = 4;
                b_hat = [1, 1, 0];
            end
        else
            if angle(y) > -pi/8
                s_hat = 0;
                b_hat = [0, 0, 0];
            elseif angle(y) > -3*pi/8
                s_hat = 7;
                b_hat = [1, 0, 0];
            elseif angle(y) > -5*pi/8
                s_hat = 6;
                b_hat = [1, 0, 1];
            elseif angle(y) > -7*pi/8
                s_hat = 5;
                b_hat = [1, 1, 1];
            else
                s_hat = 4;
                b_hat = [1, 1, 0];
            end
        end
 Count_SER(n)=Count_SER(n)+sign(abs(s_hat-s));
 Count_BER(n)=Count_BER(n)+sum(abs(b_hat-b));
 end
end
SER=Count_SER./N;
BER=Count_BER./(3*N);
semilogy(SNR_dB,SER,'b-.o',SNR_dB,BER,'r-^');
xlabel('SNR (dB)');
ylabel('Probability of errors');
legend('SER','BER');