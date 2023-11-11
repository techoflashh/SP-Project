function y=echo2channel(x,fs)
   N=floor(0.35*fs);
   a=0.55;
   y=zeros(2,length(x)+N);
   for k=1:length(y)
       if k<=N
           y(1,k)=x(1,k);
           y(2,k)=x(2,k);
       elseif k>length(x)
             y(1,k)=a*y(1,k-N);
             y(2,k)=a*y(2,k-N);
       else
           y(1,k)=x(1,k)+a*y(1,k-N);
           y(2,k)=x(2,k)+a*y(2,k-N);
       end
   end
end