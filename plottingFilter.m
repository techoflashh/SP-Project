clearvars;

% parameters
Delay = 0.35;
a = 0.4;

fs = 800;
x = [ones(40000,1);zeros(floor(Delay*fs),1)];

b=1;
c=zeros(1,floor(Delay*fs));
c(1) = 1;
c(floor(Delay*fs))=-a;

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