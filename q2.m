clearvars;
mu = 0.01;
filterLength = 64;

[noisySignal,fs] = audioread("Audio/q2_easy.wav");

for k = 2:length(noisySignal)
    if noisySignal(k) == 0
        temp = k;
        break;
    end
end

originalSignal = [noisySignal(1:temp-1); zeros(length(noisySignal)-temp+1,1)];

t = 0:1/fs:2;

originalSignal = originalSignal';
noisySignal = noisySignal';

w = zeros(1, filterLength);

for n = filterLength:length(noisySignal)
    x = noisySignal(n:-1:n-filterLength+1);
    xt = x';
    y = w * xt;
    e = originalSignal(n) - y;
    % mu = 1/(x * xt);
    w = w + 2 * mu * e * x;
end

outputSignal = filter(w, 1, noisySignal);
% outputSignal = outputSignal';

audiowrite('Audio/q2_tempEchoFreeEasy.wav', outputSignal, fs);

figure;
subplot(3,1,1); plot(originalSignal); title('Original Signal');
subplot(3,1,2); plot(noisySignal); title('Signal with Acoustic Echo');
subplot(3,1,3); plot(outputSignal); title('Echo-Free Signal');