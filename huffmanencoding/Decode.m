function [decode] = Decode(tree,sequence)
    
    n =  numel(tree(:,1))/2+1 ;
   
    ch = tree(tree(:, 5) ~= -1, 5);
    for j = 1:n
    t =   ch(j);
    codebook{j, 1} = t;
    codebook{j, 2} = code('', j, -10, tree);
    
    end
   

    
    decode = '';
    x = numel(sequence);
    s = '';
    found = 0;
    index = 0;
    i = 1;
    for j = 1:x 
      
        s = strcat (s,sequence(j));
        for z = 1:n
            if (strcmp(codebook{z, 2},s) == 1)
             found = 1;
             index = z;
             break;
            end
        end
        if found == 1
        
         found = 0;
         s = '';
         
         decode{i} =  codebook{index, 1};
         i=i+1;
        end
        
       
    end
   
    
end

function c = code(c, currentrow,pastrow,tree )
if(tree(currentrow,2) == -1)
    
    if(tree(currentrow,3) == pastrow-1)
       
    c =code( strcat('0',c), tree(currentrow-1, 2)+1,currentrow, tree);
    end
    if(tree(currentrow,4) == pastrow-1)
        
    c=code( strcat('1', c), tree(currentrow-1, 2)+1,currentrow, tree);
    end
else
   
 
    if(tree(currentrow,3) == pastrow-1)
       
    c =code( strcat('0', c), tree(currentrow, 2)+1,currentrow, tree);
    end
    if(tree(currentrow,4) == pastrow-1)
        
    c=code( strcat('1', c), tree(currentrow, 2)+1,currentrow, tree);
    end
    if( pastrow == -10) 
    c=code(c, tree(currentrow, 2)+1,currentrow, tree);
    end
    
end
end
