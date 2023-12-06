clearvars;
mu = 0.014;
filterLength = 300;
FileNameEchoed = './Input/q2_echohard.wav';%Give filename with ehoed signal
FileNameOriginal = './Input/q2_desired.wav';%Give filename with desired signal
[echoedSignal, fs] = loadAudioFile(FileNameEchoed);
[originalSignal, fs] = loadAudioFile(FileNameOriginal);

originalSignal = originalSignal';
echoedSignal = echoedSignal';

w = zeros(filterLength,1);
tempx = zeros(filterLength,1);
outputSignal = zeros(length(echoedSignal),1);
for n = 1:length(originalSignal)
    tempx = [echoedSignal(n); tempx(1:end-1)];
    outputSignal(n) = w' * tempx;
    e = originalSignal(n) - outputSignal(n);
    w = w + 2 * mu * e * tempx;
end

audiowrite('Output/q2_echohard.wav', outputSignal, fs);
sound(outputSignal,fs);
pause(length(outputSignal)/fs+1);
figure(1);
subplot(3, 1, 1);
plot(echoedSignal);
xlabel('n');
ylabel('x_{echoed}[n]');
title('Input Signal with Echo');
grid on;

subplot(3, 1, 2);
plot(originalSignal);
xlabel('n');
ylabel('x_{Desired}[n]');
title('Desired Signal Without Echo');
grid on;

subplot(3, 1, 3);
plot(outputSignal);
xlabel('n');
ylabel('y[n]');
title('Output Signal (After Adaptive Filtering)');
grid on;