function vec = vector(channel, type)
    
    if(type == 'h')
        num = 30;
    else
        num = 20;
    end
    c = histogram(channel, num);
  
    i = 1;
    bin = c.BinEdges;
    for y = 1: num
        for x = 1: c.Values(y)
     
            vec(i) = (bin(y+1)+bin(y))/2  ;
            i = i+1;
        end
    end
 
 
end
