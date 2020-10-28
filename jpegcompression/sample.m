function [ans] = sample(original,number)
  
    for i = 1: number
        for x = 1:number
            ans(i,x) = original(i,x); 
        end
    end
 
end