function [seq, codebook,h_tree] = HuffmanCode(X)

original = X;


% Creating Histogram of X sequence 
i = 1;
while numel(X) > 0
    a = X(1);
    
    input(i) = sum(X==a);
    X(X == a) = [];
    ch(i) = a;
    i = i + 1;
end

n = numel(input);


% initializing huffman tree
h_tree(1:2*n-1,1:5) = -1;
h_tree(1:n,1) = input;
h_tree(1:n,5) = char(ch);
out2(1:n,1) = input;
out2(1:n,2) = 0:n-1;
leftover = sortrows(out2);
count = n - 1;
addindex= n + 1;

% Creating huffman tree and name it h_tree
while count > 0
    %get 1st columns of first two rows added them together to get new
    %frequency first column = frequency 2nd column = index
    weight = leftover(1,1) + leftover(2,1);
    %add weight to the next index of tree
    h_tree(addindex,1) = weight;
    %add the index of left child and right child
    h_tree(addindex,3) = leftover(1,2);
    h_tree(addindex,4) = leftover(2,2);
    %set the parent +1 b/c index start at 0
    h_tree(leftover(1,2)+1,2) = addindex- 1;
    h_tree(leftover(2,2)+1,2) = addindex- 1;
    %add the new weight the left over array
    leftover(size(leftover,1)+1,1) = weight;
    leftover(size(leftover,1),2) = addindex- 1;
    % move the left over down 2 to you remove the rows that are already
    % processed
    leftover = leftover(3:end,:);
    %sort the arry again 
    leftover = sortrows(leftover); 
    count = count -1; 
    addindex= addindex+ 1;
end

for j = 1:n
    codebook{j, 1} = ch(j);
    codebook{j, 2} = code('', j, -10, h_tree);

end


seq = '';
for j = 1:numel(original)
   seq= strcat (seq,codebook{(ch == original(j)),2}) ;

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

  