% Binary Signaling Simulation
clear all;
% Binary Signaling Simulation with Orthogonal Signals

% Parameters
N = 10^6; % Number of bits
Eb = 1; % Energy per bit
SNR_dB = [-6, -3, 0, 3, 6]; % SNR in dB
SNR = 10.^(SNR_dB/10); % SNR in linear scale
No = Eb ./ SNR; % Noise power
errors = zeros(size(SNR));
theory_errors = 0.5 * erfc(sqrt(SNR)); % Theoretical error rates for orthogonal signaling

for i = 1:length(SNR)
    % Generate random bits
    bits = randi([0, 1], 1, N);
    
    % Generate orthogonal signals
    s0 = sqrt(Eb) * bits;
    s1 = sqrt(Eb) * (1 - bits);
    
    % AWGN
    n = sqrt(No(i)/2) * randn(1, N);
    
    % Received signal
    r = s0 + n;
    
    % Decision
    detected_bits = r > 0.5*Eb;
    
    % Error rate
    errors(i) = sum(detected_bits ~= bits) / N;
end

% Plot
figure;
semilogy(SNR_dB, errors, 'bo-', SNR_dB, theory_errors, 'r--');
grid on;
xlabel('SNR (dB)');
ylabel('Error Rate');
title('Binary Signaling Simulation (Orthogonal)');
legend('Simulation', 'Theory');
% Parameters

N = 10^6; % Number of bits
Eb = 1; % Energy per bit
SNR_dB = [-6, -3, 0, 3, 6, 9]; % SNR in dB
SNR = 10.^(SNR_dB/10); % SNR in linear scale
sigma = sqrt(Eb ./ (2 * SNR)); % Standard deviation of noise

% (2) Antipodal Signaling
s0 = sqrt(Eb) * ones(1, N); % Signal s0(t)
s1 = -s0; % Signal s1(t)errors_antipodal = zeros(size(SNR));
for i = 1:length(SNR)
    n = sigma(i) * randn(1, N)+j*sigma(i) * randn(1, N); % AWGN
    r = s0 + n; % Received signal
    detected_bits = r > 0; % Decision
    errors_antipodal(i) = sum(detected_bits ~= 0) / N; % Error rate
end

% (3) On-off Signaling
s1_onoff = sqrt(Eb) * ones(1, N); % Signal s1(t)
errors_onoff = zeros(size(SNR));
for i = 1:length(SNR)
    n = sigma(i) * randn(1, N)+j*sigma(i) * randn(1, N); % AWGN; % AWGN
    r = n; % Received signal
    detected_bits = r > 0; % Decision
    errors_onoff(i) = sum(detected_bits ~= 0) / N; % Error rate
end

% Theoretical Error Rates
theory_error_ortho = 0.5 * erfc(sqrt(SNR)); % Orthogonal
theory_error_antipodal = 0.5 * erfc(sqrt(SNR)); % Antipodal
theory_error_onoff = 0.5 * exp(-SNR / 2); % On-off

% Plot
figure;

semilogy(SNR_dB, errors_antipodal, 'go-', SNR_dB, theory_error_antipodal, 'm--');
hold on;
semilogy(SNR_dB, errors_onoff, 'co-', SNR_dB, theory_error_onoff, 'k--');
grid on;
xlabel('SNR (dB)');
ylabel('Error Rate');
title('Binary Signaling Simulation');
legend( 'Antipodal Simulation', 'Antipodal Theory', 'On-off Simulation', 'On-off Theory');
