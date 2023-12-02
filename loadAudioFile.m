function [audio,fs] = loadAudioFile(FileName)
    [audio,fs] = audioread(FileName);
end