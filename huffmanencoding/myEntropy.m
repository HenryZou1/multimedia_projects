function [elements ,ans] = myEntropy(x)
   
    y = double(x);
    a=hist(y,unique(y));
  
   count = 0;
    u =unique(y);
    for i = 1:length(unique(y))
       
        index = find( u(i)==x);
        ans(i) = a(i);
        count = count+a(i);
        elements(i) = x(index(1));
    end
    
   for i = 1:length(ans)
      ans(i)  = ans(i)/ count;
      
   end

end