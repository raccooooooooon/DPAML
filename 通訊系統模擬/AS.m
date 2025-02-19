clear
clc
N=1e6;
dB=-3:3:9;
SNRb=10.^(dB/10);
N0=1./SNRb;
Nt=2:2:8;
count=zeros(length(dB),4);
for k=1:4
	h=zeros(Nt(k),1);
    for kk=1:length(dB)
        for n=1:N
            b=randi(2,1,2)-1;
            if b(1)==0
                Am=1;
                Bm=1;
                if b(2)==1
                    Bm=-1;
                end
            else
                Am=-1;
                Bm=1;
                if b(2)==1
                    Bm=-1;
                end
            end
            x=Am+1j*Bm;
            h=(randn(Nt(k),1)+1j*randn(Nt(k),1))*sqrt(1/2);
            w=(randn(1)+1j*randn(1))*sqrt(N0(kk)/2);
            [p,q]=max(abs(h));
			h_as=h(q);
            y=h_as*x+w;
            r=y/h_as;
            A=real(r);
            B=imag(r);
            b_hat=zeros(1,2);
            if A<0
                b_hat(1)=1;
                if B<0
                    b_hat(2)=1;
                end
            else
                if B<0
                    b_hat(2)=1;
                end
            end
            ref=sum(b_hat~=b);
            count(kk,k)=count(kk,k)+ref;
        end
    end
end
BER=count/(2*N);
figure(1)
semilogy(dB,BER);
title('AS');
xlabel('SNR');
ylabel('BER');
axis normal;
set(gca,'xtick',-3:9);
legend('AS-L=2','AS-L=4','AS-L=6','AS-L=8');
grid on;