clearvars;

% parameters
Delay = 0.35;
a = 0.4;

fs = 800;
x = [ones(40000,1);zeros(floor(Delay*fs),1)];

yn = echoCreation(x,fs,Delay,a);

figure(1);
sgtitle("Echo Creation using Filter")
subplot(3,1,1);
stem(x);
xlabel('n');
ylabel('x[n]');
subplot(3,1,2);
impz(b,c);
subplot(3,1,3);
stem(yn);
xlabel('n');
ylabel('y[n]');