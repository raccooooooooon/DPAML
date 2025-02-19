% Binary Signaling Simulation
clear all;
% Parameters
N = 10^6; % Number of bits
Eb = 1; % Energy per bit
SNR_dB = [-6, -3, 0, 3, 6, 9]; % SNR in dB
SNR = 10.^(SNR_dB/10); % SNR in linear scale
sigma = sqrt(Eb ./ (2 * SNR)); % Standard deviation of noise

% (1) Orthogonal Signaling
s0 = sqrt(Eb) * ones(1, N); % Signal s0(t)
s1 = -s0; % Signal s1(t)
errors_ortho = zeros(size(SNR));
for i = 1:length(SNR)
    n = sigma(i) * randn(1, N); % AWGN
    r = s0 + n; % Received signal
    detected_bits = r > 0; % Decision
    errors_ortho(i) = sum(detected_bits ~= 0) / N; % Error rate
end
theory_error_ortho = 0.5 * erfc(sqrt(SNR)); % Orthogonal

figure;
semilogy(SNR_dB, errors_ortho, 'bo-', SNR_dB, theory_error_ortho, 'r--');
hold on;
grid on;
xlabel('SNR (dB)');
ylabel('Error Rate');
title('Binary Signaling Simulation');
legend('Orthogonal Simulation', 'Orthogonal Theory')