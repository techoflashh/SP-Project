clear vars;

% Give the FileName Here
FileName = "./Audio/q1.wav";

% Loading the audio file using the function loadAudioFile
[y,Fs] = loadAudioFile(FileName);

% Give the parameters Delay(in seconds) a(attenuation factor taking values in (0,1))
Delay=10;
a=0.65;

% Creating the echoed signal using the function echoCreation
yn=echoCreation(y,Fs,Delay,a);

% Playing the echoed Output
sound(yn,Fs);