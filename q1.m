clear vars;
[y,Fs] = audioread("m5.mp3");
y=transpose(y);
yn=echo2channel(y,Fs);
sound(yn,Fs);
pause(length(yn)/Fs+1);
% yn=transpose(yn);
% audiowrite("Gaana.wav",yn,Fs);

Y1 = fft(y);
Y2 = fft(yn);

k1 = 0:2*pi/length(y):2*pi-2*pi/length(y);
k2 = 0:2*pi/length(yn):2*pi-2*pi/length(yn);


figure(1);
subplot(2,1,2);
plot(k1,Y1);
hold on;
plot(k2,Y2);
hold off;
legend('Original','Echoed');
subplot(2,1,1);
plot(0:500,y(Fs+1:Fs+501));
hold on;
plot(0:500,yn(Fs+1:Fs+501));
hold off;
legend('Original','Echoed');