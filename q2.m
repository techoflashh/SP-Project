clearvars;
mu = 0.014;
filterLength = 300;

% Easy File
FileName = 'Audio/q2_easy.wav';
[echoedSignal, fs] = loadAudioFile(FileName);

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
FileName = 'Audio/q2_not_so_easy.wav';
[echoedSignal, fs] = loadAudioFile(FileName);

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

flag2 = 0;
for k = temp1:length(echoedSignal)
    if (echoedSignal(k) == 0 && flag2 == 0)
        for k1 = 1:1000
            if (echoedSignal(k+k1)~=0)
                break;
            elseif (k1 == 1000)
                flag2 = k;
            end
        end
    elseif (flag2 ~= 0 && echoedSignal(k) ~= 0)
        temp2 = k;
        break;
    end
end

originalSignal = echoedSignal(1:flag-1);
% echoedSignal = [echoedSignal(temp1:flag2-1); zeros(length(echoedSignal)-flag2+1,1)];
echoedSignal = echoedSignal(temp2:end);
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
% xlim([0,140000]);
xlabel('n');
ylabel('x_{echoed}[n]');
title('Input Signal with Echo');
grid on;

subplot(3, 1, 2);
plot(originalSignal);
% xlim([0,140000]);
xlabel('n');
ylabel('x_{Desired}[n]');
title('Desired Signal Without Echo');
grid on;

subplot(3, 1, 3);
plot(outputSignal);
% xlim([0,140000]);
xlabel('n');
ylabel('y[n]');
title('Output Signal (After Adaptive Filtering)');
grid on;