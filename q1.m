clearvars;

% Give the FileName Here
FileName = "./Audio/q1.wav";

% Loading the audio file using the function loadAudioFile
[y,fs] = loadAudioFile(FileName);

% Give the parameters Delay(in seconds) a(attenuation factor taking values in (0,1))
Delay=0.35;
a=0.5;

% Creating the echoed signal using the function echoCreation
yn=echoCreation(y,fs,Delay,a);

audiowrite('Audio/q1_EchoedEasy.wav', yn, fs);

% Playing the echoed Output
sound(yn,fs);
pause(1+length(yn)/fs);

% Give the FileName Here
FileName = "./Audio/q1_hard.wav";

% Loading the audio file using the function loadAudioFile
[y,fs] = loadAudioFile(FileName);

% Creating the echoed signal using the function echoCreation
yn=echoCreation(y,fs,Delay,a);

audiowrite('Audio/q1_EchoedHard.wav', yn, fs);

% Playing the echoed Output
sound(yn,fs);
pause(1+length(yn)/fs);


