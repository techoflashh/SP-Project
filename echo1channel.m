function y=echo1channel(x,fs)
   N=floor(0.35*fs);
   a=0.75;
   y=zeros(1,length(x)+N);
   for k=1:length(y)
       if k<=N
           y(1,k)=x(1,k);
  
       elseif k>length(x)
             y(1,k)=a*y(1,k-N);
            
       else
           y(1,k)=x(1,k)+a*y(1,k-N);
          
       end
   end
end