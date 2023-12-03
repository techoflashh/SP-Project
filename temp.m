clearvars;

% Load Data
[x, Fs] = audioread('Audio/q2_not_so_easy.wav'); % Input signal with echo

flag = 0;
for k = 2:length(x)
    if (x(k) == 0 && flag == 0)
        flag = k;
    elseif (flag ~= 0 && x(k) ~= 0)
        temp1 = k;
        break;
    end
end


d = x(1:flag-1); % Desired signal (Input signal with echo)
x = x(temp1:end); % Input signal with echo

d = [d; zeros(length(x) - length(d), 1)]; % Zero padding

% Define the needed variables
L = 64; % Length of adaptive filter (same length of RIR)
N = length(x); % Number of iterations

% Initial values
w = zeros(L, 1); % Initial weight vector of AF Lx1
xin = zeros(L, 1); % Initial input signal of AF Lx1

% Make column vectors
x = x(:); % Input signal with echo Nx1
d = d(:); % Desired signal Nx1

% The values for calculating Step-Size of Adaptive Filter
mu = 0.014;

% LMS algorithm for Adaptive Filter
y = zeros(N, 1); % Initialize the output signal after adaptive filter
e = zeros(N, 1); % Initialize the estimation error
for i = 1:N
    for j = L:-1:2
        xin(j) = xin(j - 1);
    end
    xin(1) = x(i); % Insert new sample at the beginning of input

    y(i) = w' * xin; % Output signal after adaptive filter
    error = d(i) - y(i); % ERROR
    e(i) = error; % Store estimation error
    w = w + 2 * mu * error * xin; % Update filter
end

% ERLE
ERLE = zeros(N - L, 1); % Initialize Echo Return Loss Enhancement
for i = 1:N - L
    % Echo Return Loss Enhancement
    ERLE(i) = 10 * log10(mean(abs(d(i:i + L)).^2) / mean(abs(e(i:i + L)).^2));
end

% Plotting the necessary signals
figure;

% Input signal with echo
subplot(4, 1, 1);
plot(x);
xlabel('Sample');
ylabel('Amplitude');
title('Input Signal with Echo');
grid on;

% Desired signal (with echo)
subplot(4, 1, 2);
plot(d);
xlabel('Sample');
ylabel('Amplitude');
title('Desired Signal (with Echo)');
grid on;

% Output signal after adaptive filtering
subplot(4, 1, 3);
plot(y);
xlabel('Sample');
ylabel('Amplitude');
title('Output Signal (After Adaptive Filtering)');
grid on;

% ERLE
subplot(4, 1, 4);
plot(ERLE);
xlabel('Sample');
ylabel('ERLE (dB)');
title('Echo Return Loss Enhancement (ERLE)');
grid on;

sound(y,Fs);