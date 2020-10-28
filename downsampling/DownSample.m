function [] = DownSample( inFile, outFile, N, pf)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [x, Fs] = audioread(inFile);
    if (pf == 0)
        temp = downsample(x, N);
    else
        temp = decimate(x,N);
    end
    audiowrite(outFile, temp, round(Fs/N));
    recon= interp(temp,N);
    recover = strcat('recovered', outFile);
    audiowrite(recover, recon, round(Fs*N));
end
