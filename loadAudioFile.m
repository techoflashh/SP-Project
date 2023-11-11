function [y,Fs] = loadAudioFile(FileName)
    [y,Fs] = audioread(FileName);
end