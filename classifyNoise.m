function [noiseType, rmserror, rmsavg] = classifyNoise(audio)
    noises = ["Fan","Pressure Cooker","Water pump","Traffic"];
    [y,fs] = loadAudioFile(audio);
    coeffs = mfcc(y,fs);
    average = mean(coeffs(:,1));
    maximum = max(coeffs(:,1));

    for k = 1:length(coeffs(:,1))
        if (coeffs(k,1)==maximum)
            maxi = k;
            break;
        end
    end

    for k = maxi:-1:1
        if (coeffs(k,1)<average)
            flaglow = k;
            break;
        end
    end

    for k=maxi:length(coeffs(:,1))
        if (coeffs(k,1)<average)
            flaghigh = k;
            break;
        end
    end
    rmserror=rmse(coeffs(flaglow:flaghigh,1),ones(length(coeffs(flaglow:flaghigh,1)),1)*maximum);
    rmsavg = rmse(coeffs(flaglow:flaghigh,1),ones(length(coeffs(flaglow:flaghigh,1)),1)*mean(coeffs(flaglow:flaghigh)));
    var = rmsavg*rmsavg;
    if rmserror < 0.5
        if maximum>4.5
            noiseType = noises(2);
            return;
        end
    elseif rmserror > 1.7
        noiseType = noises(3);
        return;
    end
    if var < 0.12
        noiseType = noises(1);
    else
        noiseType = noises(4);
    end
end