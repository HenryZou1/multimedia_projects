function [ans] = combineimg(img)
 
  dim = size(img);
  numblock = dim(1)*dim(2) *dim(3);
  newsize = sqrt(numblock);
  
    row = 0;
    col = 0;
   for i = 1: dim(3)
     
      temp(1:8,1:8) = img( 1:8, 1:8,i);
     
      
      temp = idct2(temp);
    
       ans(1+row*8:8+row*8, 1+col*8:8+col*8) = temp;
       
       row= row+1;
       
       if(row ==newsize/8)
         
           col = col +1;
           row = 0;
       end
   end
 

 
end