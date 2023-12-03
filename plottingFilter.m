clearvars;

% parameters
Delay = 0.35;
a = 0.5;

fs = 80000;
x = [ones(400000,1);zeros(floor(Delay*fs),1)];

b=zeros(1,floor(Delay*fs));
b(1)=1;
b(floor(Delay*fs))=a;
c=1;

yn = filter(b,c,x);

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