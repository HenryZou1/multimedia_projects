function [error] = MulawQuant( inFile, outFile, N, Mu)
%UNTITLED2 Summary of this function goes here
%   mulaw
    [xn, Fs] = audioread(inFile);
    temp = xn;
    error = xn;
    maxs = max(max(xn));
    for J = 1 : size(xn,1)
     for K = 1 : size(xn,2)
        temp(J,K) =maxs*(log10(1+Mu*abs(xn(J,K))/maxs)/log10(1+Mu))*sign(xn(J,K));
     end
    end
    
    %qunatize
    maxs = max(max(temp));
    mins = min(min(temp));
    
    q = (maxs- mins)/ power(2,N);
    for J = 1 : size(temp,1)
     for K = 1 : size(temp,2)
        temp(J,K) =round(temp(J,K)/q);
     end
    end
    
   
    for J = 1 : size(xn,1)
     for K = 1 : size(xn,2)
        temp(J,K) =temp(J,K)*q;
        
     end
    end
    
    maxs = max(max(temp));
    for J = 1 : size(xn,1)
     for K = 1 : size(xn,2)
        temp(J,K) =maxs/Mu*power(10,(log10(1+10)*abs(xn(J,K))/maxs))*sign(xn(J,K)) ;
        error(J,K) = power(error(J,K)-temp(J,K), 2 );
     end
    end
    
   immse(temp,xn)
   
    
    audiowrite(outFile, temp, Fs);
end