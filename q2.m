clearvars;
mu = 0.014;
filterLength = 300;

% Easy File
[echoedSignal, fs] = audioread('Audio/q2_easy.wav');

flag = 0;
for k = 2:length(echoedSignal)
    if (echoedSignal(k) == 0 && flag == 0)
        for k1 = 1:1000
            if (echoedSignal(k+k1)~=0)
                break;
            elseif (k1 == 1000)
                flag = k;
            end
        end
    elseif (flag ~= 0 && echoedSignal(k) ~= 0)
        temp1 = k;
        break;
    end
end

originalSignal = echoedSignal(1:flag-1);
echoedSignal = echoedSignal(temp1:end);
originalSignal = [originalSignal; zeros(length(echoedSignal) - length(originalSignal), 1)];

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

audiowrite('Audio/q2_EchoFreeEasy.wav', outputSignal, fs);

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

% Not So Easy File
[echoedSignal, fs] = audioread('Audio/q2_not_so_easy.wav');

flag = 0;
for k = 2:length(echoedSignal)
    if (echoedSignal(k) == 0 && flag == 0)
        for k1 = 1:1000
            if (echoedSignal(k+k1)~=0)
                break;
            elseif (k1 == 1000)
                flag = k;
            end
        end
    elseif (flag ~= 0 && echoedSignal(k) ~= 0)
        temp1 = k;
        break;
    end
end

originalSignal = echoedSignal(1:flag-1);
echoedSignal = echoedSignal(temp1:end);
originalSignal = [originalSignal; zeros(length(echoedSignal) - length(originalSignal), 1)];

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

audiowrite('Audio/q2_EchoFreeNotSoEasy.wav', outputSignal, fs);

figure(2);
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