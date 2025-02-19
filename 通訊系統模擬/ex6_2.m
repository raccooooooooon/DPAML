clear all;
SNR_dB=[-3 0 3 6 9];
M=[2 4 8 16];
N=10^6;
Count_BER=zeros(length(M),length(SNR_dB));
 
 for ii=1:length(M)
    for n=1:length(SNR_dB)
     E=(M(ii)^2-1)/(3*log2(M(ii)));
     SNR=10^(SNR_dB(n)/10);
     N0=E/(SNR);
        for t=1:N
          b=floor(rand(1)*M(ii)); 
          x=(2*b-2*M(ii)+1);
          w=(randn(1))*sqrt(N0/2);
          y=x+w;
          if abs(y-x)>1
             Count_BER(ii,n)=Count_BER(ii,n)+1;
          end
        end
     end
 end
BER=Count_BER./N;

semilogy(SNR_dB,BER(1,:),'g-.');
hold on;
semilogy(SNR_dB,BER(2,:),'b-.');
hold on;
semilogy(SNR_dB,BER(3,:),'r-.');
hold on;
semilogy(SNR_dB,BER(4,:),'k-.');
hold on;
xlabel('SNR');
ylabel('錯誤率 ');
legend('M=2','M=4','M=8','M=16');
