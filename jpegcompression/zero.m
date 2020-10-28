function [ans] = zeros(original,highlowdc)
    [m,n] = size(original);
  
    for i = 1: n
        for x = 1:m
            if(highlowdc == 0 && i ==1 && x ==1)
                 ans(i,x) = 0;
               continue;
            elseif(highlowdc == 1 && abs(original(i,x)) < 1)
                 ans(i,x) = 0;
                continue;
            
            elseif(highlowdc == 2 && abs(original(i,x)) > 2 && i ~=1 && x ~=1)
                 ans(i,x) = 0;
                continue;
            end
            
            ans(i,x) = original(i,x); 
        end
    end
 
end