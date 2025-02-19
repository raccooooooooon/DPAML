% 1. Binary Signaling (Orthogonal)
clear all;
close all;

% Parameters
N = 10^6; % Number of symbols
E = 1; % Energy of each symbol
SNR_dB = [-6, -3, 0, 3, 6]; % SNR in dB
SNR = 10.^(SNR_dB./10); % SNR in linear scale
N0 = E./SNR; % Noise power spectral density
sigma = sqrt(N0./2); % Standard deviation of noise

% Generate random binary sequence
data = randi([0,1],1,N);

% Generate orthogonal signals
s0 = sqrt(E).*ones(1,N);
s1 = -s0;

% Initialize error counters
errors = zeros(1,length(SNR));

for i = 1:length(SNR)
    % Add AWGN
    n = sigma(i).*randn(1,N);
    r = s0.*(data==0) + s1.*(data==1) + n;

    % Correlator receiver
    y = sum(r.*s0);
    decisions = y > sum(r.*s1);
    
    % Count errors
    errors(i) = sum(data ~= decisions);
end

% Calculate BER
BER_Orth = errors./N;

% Theoretical BER for orthogonal signaling
BER_theoretical_Orth = 0.5*erfc(sqrt(SNR));

% Plot results
figure;
semilogy(SNR_dB, BER_Orth, 'o-', 'LineWidth', 2);
hold on;
semilogy(SNR_dB, BER_theoretical_Orth, 'r--', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('BER');
title('Binary Signaling (Orthogonal)');
legend('Simulation', 'Theory');
ylim([1e-5, 1]);
xlim([-6, 6]);
