function y=echoCreation(x,fs,Delay,a)
    [l,ch] = size(x);
    x = [x;zeros(floor(Delay*fs),ch)];
    b=1;
    c=zeros(1,floor(Delay*fs));
    c(1)=1;
    c(floor(Delay*fs))=a;
    y=filter(c,b,x);
end