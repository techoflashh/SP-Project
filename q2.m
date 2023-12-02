clearvars;

[y,fs] = audioread("Audio/q2_not_so_easy.wav");

y1 = y(1:88200);
y2 = y(132401:220600);
y3 = y(264601:352800);
y4 = y(396901:485100);



a = 0.6;
ai = 1/a;

y0 = [y1; zeros(44100,1); ai*y2; zeros(44100,1); ai*ai*y3; zeros(44100,1); ai*ai*ai*y4];

% % sound(y0,fs);

audiowrite("Audio/q2_tempOriginalEasy.wav",y0,fs);
audiowrite("Audio/q2_tempEchoedEasy.wav",y,fs);

plot(1:length(y),fft(y));