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
 %-----------------------------------
 %generate received signal
 s=floor(rand(1)*16); % symbol={0, 1,2,3}
 if s<=3
 r=2^0.5;
 elseif s<=7
 r=3*(2^0.5);
 else
 r=10^0.5;
 end
 
 if s==0 || s==4
 an=pi/4;
 elseif s==1 || s==5
 an=3*pi/4;
 elseif s==2 || s==6
 an=5*pi/4;
 elseif s==3 || s==7
 an=7*pi/4;
 elseif s==8
 an=atan(1/3);
 elseif s==9
 an=atan(3/1);
 elseif s==10
 an=atan(1/3)+pi/2;
 elseif s==11
 an=atan(3/1)+pi/2;
 elseif s==12
 an=atan(1/3)+pi;
 elseif s==13
 an=atan(3/1)+pi;
 elseif s==14
 an=atan(1/3)+3*pi/2;
 elseif s==15
 an=atan(3/1)+3*pi/2;
 end
 x=r*exp(j*an);
 b=codew((s+1),:);
 w=(randn(1)+j*randn(1))*sqrt(N0/2);
 y=x+w; % 接收訊號
 %-------------------------------------
 %Detection
 if abs(y)*sin(angle(y))>=2 && abs(y)*cos(angle(y))<=-2
 s_hat=5;
 elseif abs(y)*sin(angle(y))>=2 && abs(y)*cos(angle(y))<=0
 s_hat=10;
 elseif abs(y)*sin(angle(y))>=2 && abs(y)*cos(angle(y))<=2
 s_hat=9;
 elseif abs(y)*sin(angle(y))>=2 
 s_hat=4;
 elseif abs(y)*sin(angle(y))>=0 && abs(y)*cos(angle(y))<=-2
 s_hat=11;
 elseif abs(y)*sin(angle(y))>=0 && abs(y)*cos(angle(y))<=0
 s_hat=1;
 elseif abs(y)*sin(angle(y))>=0 && abs(y)*cos(angle(y))<=2
 s_hat=0;
 elseif abs(y)*sin(angle(y))>=0
 s_hat=8;
 elseif abs(y)*sin(angle(y))>=-2 && abs(y)*cos(angle(y))<=-2
 s_hat=12;
 elseif abs(y)*sin(angle(y))>=-2 && abs(y)*cos(angle(y))<=0
 s_hat=2;
 elseif abs(y)*sin(angle(y))>=-2 && abs(y)*cos(angle(y))<=-2
 s_hat=3;
 elseif abs(y)*sin(angle(y))>=-2 
 s_hat=15;
 elseif abs(y)*cos(angle(y))<=-2
 s_hat=6;
 elseif abs(y)*cos(angle(y))<=0
 s_hat=13;
 elseif abs(y)*cos(angle(y))<=2
 s_hat=14;
 else
 s_hat=7;
 end
 
 
 b_hat=codew((s_hat+1),:);
 Count_SER(n)=Count_SER(n)+sign(abs(s_hat-s));
 Count_BER(n)=Count_BER(n)+sum(abs(b_hat-b));
 end
 end

SER=Count_SER./N;
BER=Count_BER./(4*N);
semilogy(SNR_dB,SER,'b-.o',SNR_dB,BER,'r-^');
xlabel('SNR (dB)');
ylabel('Probability of errors');
legend('SER','BER');