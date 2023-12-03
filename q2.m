clearvars;
mu = 0.01;

[noisySignal,fs] = audioread("Audio/q2_not_so_easy.wav");

for k = 2:length(noisySignal)
    if noisySignal(k) == 0
        temp = k;
        break;
    end
end

originalSignal = [noisySignal(1:temp-1); zeros(length(noisySignal)-temp+1,1)];
filterLength = length(originalSignal);

t = 0:1/fs:2;

originalSignal = originalSignal';
noisySignal = noisySignal';

w = zeros(1, filterLength);

for n = 1:100
    % x = noisySignal(n:-1:n-filterLength+1);
    xt = originalSignal';
    y = w * xt;
    e = originalSignal(n) - y(n);
    % mu = 1/(x * xt);
    w = w + 2 * mu * e .* x;
end

outputSignal = filter(w, 1, noisySignal);

% audiowrite('Audio/q2_tempEchoFreeEasy.wav', outputSignal, fs);

figure;
subplot(3,1,1); plot(originalSignal); title('Original Signal');
subplot(3,1,2); plot(noisySignal); title('Signal with Acoustic Echo');
subplot(3,1,3); plot(outputSignal); title('Echo-Free Signal');