function [ans] = divideimg(img)
 
  dim = size(img);
  numblock = dim(1)*dim(2) / 64;
   row = 0;
       col = 0;
   for i = 1: numblock
     
       temp = img(1+row*8:8+row*8, 1+col*8:8+col*8);
      temp = dct2(temp);
       ans(1:8, 1:8,i) = temp;
       row= row+1;
       if(row ==dim(2)/8)
           col = col +1;
           row = 0;
       end
   end
 
   
 
end