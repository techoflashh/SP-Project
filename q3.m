clearvars;

inputFile = 'Audio/music_city-traffic.wav';

[audio,fs] = loadAudioFile(inputFile);

sound(audio,fs);

noiseType = classifyNoise(audio);

disp(['The noise type is: ' noiseType])