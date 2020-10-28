function h = entro(x)
   h = 0;
   for i = 1:length(x)
       if(x(i) ~= 0)
        h =h -  x(i) * log2(x(i)) ;
       end
    end
end