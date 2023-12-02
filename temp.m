% Parameters
mu = 0.01; % LMS step size
filterLength = 64; % Length of the adaptive filter
delay1 = 20; % Delay for the first echo
delay2 = 40; % Delay for the second echo
delay3 = 60; % Delay for the third echo

% Generate a sample signal with multiple echoes
fs = 1000; % Sampling frequency
t = 0:1/fs:2; % Time vector
originalSignal = sin(2*pi*50*t) + 0.5*sin(2*pi*150*t); % Original signal

% Simulate multiple echoes
echo1 = 0.3*sin(2*pi*50*(t - delay1)); % First echo
echo2 = 0.2*sin(2*pi*50*(t - delay2)); % Second echo
echo3 = 0.1*sin(2*pi*50*(t - delay3)); % Third echo
noisySignal = originalSignal + echo1 + echo2 + echo3; % Signal with multiple echoes

% Adaptive Filter Initialization
w = zeros(1, filterLength);

% Adaptive Filtering using LMS for multiple echoes
for n = filterLength:length(noisySignal)
    x = noisySignal(n:-1:n-filterLength+1); % Input vector
    y = w * x.'; % Output of the adaptive filter
    e = originalSignal(n) - y; % Error signal
    w = w + mu * e * x; % Update filter weights
end

% Apply the adaptive filter to the entire signal to get the echo-free signal
outputSignal = filter(w, 1, noisySignal);

% Plot the results
figure;
subplot(3,1,1); plot(originalSignal); title('Original Signal');
subplot(3,1,2); plot(noisySignal); title('Signal with Multiple Echoes');
subplot(3,1,3); plot(outputSignal); title('Echo-Free Signal');
