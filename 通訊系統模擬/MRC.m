clear
clc
% clf

% Eavb=1, Eav=2
N=1e5;
dB=-3:3:9;
SNRb=10.^(dB/10);
N0=1./SNRb;
Nr=2:2:8;
count=zeros(length(dB),4);
for k=1:4
	h=zeros(Nr(k),1);
	y=zeros(Nr(k),1);
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
			h=(randn(Nr(k),1)+1j*randn(Nr(k),1))*sqrt(1/2);
			w=(randn(Nr(k),1)+1j*randn(Nr(k),1))*sqrt(N0(kk)/2);
			y=h*x+w;
			alpha_mrc=h';
			z_mrc=alpha_mrc*y;
			h_mrc=alpha_mrc*h;
			r=z_mrc/h_mrc;
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
figure(3)
semilogy(dB,BER);
title('Maximum Ratio Combining');
xlabel('SNR per bit (dB)');
ylabel('BER');
axis normal;
set(gca,'xtick',-3:9);
legend('Nr=2','Nr=4','Nr=6','Nr=8');
grid on;