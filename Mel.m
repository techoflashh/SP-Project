clearvars;
[y, Fs] = audioread("Audio/music_pressure-cooker.wav");
windowsize = floor(0.05* Fs);
N=windowsize+4-rem(windowsize,4);
hopsize = floor(windowsize/2);
numberofwindows = floor((length(y) - windowsize) / hopsize);
mfcc = zeros(numberofwindows, 13);  

for k = 1:numberofwindows
    window_start = (k - 1) * hopsize + 1;
    window_end = window_start + windowsize - 1;
    window_data = y(window_start:window_end);
    b= coefficients(window_data, Fs, N);
    mfcc(k,:)=b;
end


plot(mfcc(:,1));


