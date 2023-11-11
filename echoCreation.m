function y=echoCreation(x,fs,Delay,a)
    [samples,channel]=size(x);
    N=floor(Delay*fs);
    b=floor(N/samples);
    if(N<=samples)
        length=samples+4*N;
    else
        length=4*N;
    end
    y=zeros(length,channel);
    for k=1:channel
        for l=1:length
            if(l<=N)
                if(l<=samples)
                   y(l,k)=x(l,k);
                else
                    y(l,k)=0;
                end
            else
                if(l<=samples)
                    y(l,k)=x(l,k)+a*y(l-N,k);
                else
                    y(l,k)=a*y(l-N,k);
                end
            end
        end
    end
   
end