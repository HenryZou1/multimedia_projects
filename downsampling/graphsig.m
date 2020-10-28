function [] = graphsig( filename )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    [xn, fs]=audioread(filename);
    L=1024; %number of point in DTFT
    Y = fft(xn,L);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    f = fs*(0:(L/2))/L;
    plot(f,P1) 
    xlabel('Frequency');
    ylabel('Amplitude');
    title('Single-Sided Amplitude Spectrum of Audio')
end

