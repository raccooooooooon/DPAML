clear all;
SNR_dB=[-3 0 3 6 9];
N=10^6;
Count_SER=zeros(1,length(SNR_dB));
Count_BER=zeros(1,length(SNR_dB));
codew=[1 0 1 1 ;1 0 0 1 ;0 0 0 1 ;0 0 1 1 ;1 0 1 0 ;1 0 0 0 ;0 0 0 0 ;...
    0 0 1 0 ;1 1 1 0 ;1 1 0 0 ;0 1 0 0 ;0 1 1 0 ;1 1 1 1 ;1 1 0 1 ;0 1 0 1 ;0 1 1 1];

for n=1:length(SNR_dB)
   SNR=10^(SNR_dB(n)/10);
   N0=2.5/(SNR);
   for t=1:N
     s=floor(rand(1)*16); 
     if s<=3
        im=3;
        elseif s<=7
           im=1;
        elseif s<=11
           im=-1;
        elseif s<=15
           im=-3;
     end
 
     if mod(s,4)==0
       re=-3;
     elseif mod(s,4)==1
       re=-1;
     elseif mod(s,4)==2
       re=1;
     elseif mod(s,4)==3
       re=3;
     end
 x=re+j*im;
 b=codew((s+1),:);
 w=(randn(1)+j*randn(1))*sqrt(N0/2);
 y=x+w; 
 if imag(y)>=2
    s_hat=0;
 elseif imag(y)>=0
    s_hat=4;
 elseif imag(y)>=-2
    s_hat=8;
 else
    s_hat=12;
 end
 
 if real(y)<=-2
 elseif real(y)<=0
    s_hat=s_hat+1;
 elseif real(y)<=2
    s_hat=s_hat+2;
 else
    s_hat=s_hat+3;
 end
 
 b_hat=codew((s_hat+1),:);
 Count_SER(n)=Count_SER(n)+sign(abs(s_hat-s));
 Count_BER(n)=Count_BER(n)+sum(abs(b_hat-b));
 end
 end

SER=Count_SER./N;
BER=Count_BER./(4*N);
semilogy(SNR_dB,SER,'b-.o',SNR_dB,BER,'g-^');
xlabel('SNR (dB)');
ylabel('¿ù»~²v');
legend('SER','BER');