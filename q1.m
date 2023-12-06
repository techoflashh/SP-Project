clearvars;

% Give the FileName Here
FileName = "./Input/q1.wav";

% Loading the audio file using the function loadAudioFile
[y,fs] = loadAudioFile(FileName);

% Give the parameters Delay(in seconds) a(attenuation factor taking values in (0,1))
Delay=0.35;
a=0.4;

% Creating the echoed signal using the function echoCreation
yn=echoCreation(y,fs,Delay,a);

audiowrite('Output/q1_EchoedEasy.wav', yn, fs);

% Playing the echoed Output
sound(yn,fs);
pause(1+length(yn)/fs);




% Give the FileName Here
FileName = "./Input/q1_hard.wav";

% Loading the audio file using the function loadAudioFile
[y,fs] = loadAudioFile(FileName);

% Creating the echoed signal using the function echoCreation
yn=echoCreation(y,fs,Delay,a);

audiowrite('Output/q1_EchoedHard.wav', yn, fs);

% Playing the echoed Output
sound(yn,fs);
pause(1+length(yn)/fs);


figure(1);
subplot(2, 1, 1);
plot(y);
xlabel('n');
ylabel('x_{Original}[n]');
title('Original Signal');
grid on;

subplot(2, 1, 2);
plot(yn);
xlabel('n');
ylabel('x_{Echoed}[n]');
title('Echoed Signal');
grid on;

sgtitle('q1hard');

