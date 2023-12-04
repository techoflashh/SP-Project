function mfcc = coefficients(x, fs, N)  % Changed the size of mfcc
    w = hann(length(x));
    y = w .* x;
    Y = fft(y, N);
    %maxim = max(P)
    low = 0;
    high = fs / 2;
    Mlow = hz2mel(low);
    Mhigh = hz2mel(high);
    M = linspace(Mlow, Mhigh, 13+ 2);
    Mupdated = mel2hz(M);  % Corrected the formul
    freq=0:fs/(N):fs/2-fs/N;
    for k=1:13
        [~,index]=min(abs(Mupdated(k)-freq));
        Mupdated(k)=freq(index);
    end

    K = zeros(13,N/2);
    L=zeros(13,N/2);
     for l = 2:14
        c=Mupdated(l-1)+(Mupdated(l)-Mupdated(l-1))/(N/4):(Mupdated(l)-Mupdated(l-1))/(N/4):Mupdated(l);
        d=Mupdated(l):(Mupdated(l+1)-Mupdated(l))/(N/4):Mupdated(l+1)-(Mupdated(l+1)-Mupdated(l))/(N/4);
        a=(c-Mupdated(l-1))/(Mupdated(l)-Mupdated(l-1));
        b=(d-Mupdated(l+1))/(Mupdated(l)-Mupdated(l+1));
        K((l-1),:)=[a,b];
        L((l-1),:)=[c,d];
        
     end
     mfcc=zeros(13,1);
     for l=1:13
         sum=0;
         for m=1:N/2
            [~,index]=min(abs(L(l,m)-freq));
            sum=sum+Y(index)*K(l,m);
         end
         mfcc(l)=sum;

     end
     mfcc=log(abs(mfcc));
     mfcc=dct(mfcc);


end
