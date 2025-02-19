clear all;
SNR_dB=[-3 0 3 6 9];
N=10^4;
Count_SER=zeros(1,length(SNR_dB));
Count_BER=zeros(1,length(SNR_dB));
codew=[0 0 0 ;0 0 1 ;0 1 1 ;0 1 0 ;1 1 0; 1 1 1; 1 0 1; 1 0 0];
for n=1:length(SNR_dB)
    SNR=10^(SNR_dB(n)/10);
    N0=1/(3*SNR);
    for t=1:N
        %-----------------------------------
        %generate received signal
        s=floor(rand(1)*8); % symbol={0, 1,2,3}
        phi=(pi/8)+s*(pi/4);
        x=exp(1i*phi);
        %  b=zeros(3,1); % two-bit data
        %  b(1)=(imag(x)<0);
        %  b(2)=(real(x)<0);
        b=codew((s+1),:);
        w=(randn(1)+1i*randn(1))*sqrt(N0/2);
        y=x+w; % 接收訊號
        %-------------------------------------
        %Detection
        s_hat=(imag(y)+2);

        if angle(y)<0
            s_hat=floor(4*(angle(y)+2*pi)/pi);
        else
            s_hat=floor(4*angle(y)/pi);
        end
        
        b_hat=codew((s_hat+1),:);
        Count_SER(n)=Count_SER(n)+sign(abs(s_hat-s));
        Count_BER(n)=Count_BER(n)+sum(abs(b_hat-b));
    end
end

SER=Count_SER./N;
BER=Count_BER./(3*N);
semilogy(SNR_dB,SER,'g-.o',SNR_dB,BER,'r-^');
xlabel('SNR (dB)');
ylabel('Probability of errors');
legend('SER','BER');