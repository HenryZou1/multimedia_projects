function dis = manhattan(picture1, picture2)
    
    d = size(picture1);
    dis = 0;
    for y = 1: d(2)
        dis = dis + picture1(1,y) - picture2(1,y);
    end
 
 
end