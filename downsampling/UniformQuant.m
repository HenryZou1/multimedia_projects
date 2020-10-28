function [error] = UniformQuant( inFile, outFile, N)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [xn, Fs] = audioread(inFile);

    maxs = max(max(xn));
    mins = min(min(xn));
    temp = xn;
   error = xn;
    q = (maxs- mins)/ power(2,N);
    for J = 1 : size(xn,1)
     for K = 1 : size(xn,2)
        temp(J,K) =round(xn(J,K)/q);
        
     end
    end
   for J = 1 : size(xn,1)
     for K = 1 : size(xn,2)
        temp(J,K) =temp(J,K)*q;
        error(J,K) = power(error(J,K)-temp(J,K), 2 );
     end
    end
   immse(temp,xn)
    audiowrite(outFile, temp, Fs);
end