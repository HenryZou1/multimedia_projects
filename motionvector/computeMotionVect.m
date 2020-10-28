function [dx,dy] = computeMotionVect(framePrev, frameCurr,p,q,k)
d = size(frameCurr);
highdiff = 999999;
diff=0;
 if((p+k) < d(1) |(q+k) < d(2))
     dx = p;
     dy = q;
     return;
 end
for rx = 0 : k
 for ry = 0 : k
    for x = p: p+16
       for y = q: q+16
         
            
            diff =diff+ abs(frameCurr(x+rx,y+ry)- framePrev(x,y));
            
       
       end 
    end
    if(diff < highdiff)
        highdiff = diff;
        dx = p+rx;
        dy = q+ry;
    end
    diff = 0;
 end
end
