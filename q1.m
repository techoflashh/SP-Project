clear vars;
[y,Fs] = audioread("./Audio/q1_hard.wav");
Delay=3;
a=0.65;
yn=echo(y,Fs,Delay,a);
sound(yn,Fs);
%pause(length(yn)/Fs+1);
% yn=transpose(yn);
% audiowrite("Gaana.wav",yn,Fs);

Y1 = fft(y);
Y2 = fft(yn);

k1 = 0:2*pi/length(y):2*pi-2*pi/length(y);
k2 = 0:2*pi/length(yn):2*pi-2*pi/length(yn);


figure(1);
subplot(2,1,2);
plot(k2,Y2);
hold on;
plot(k1,Y1);
hold off;
legend('Original','Echoed');
subplot(2,1,1);
% plot(0:length(y)-1,y);
% hold on;
plot(0:length(yn)-1,yn);
% hold off;
% legend('Original','Echoed');