%part 1%
%12
a = imread('lena.jpg');
[ele, per] = myEntropy('HUFFMAN IS THE BEST COMPRESSION ALGORITHM');
 entro (per)
8 / entro (per)
%34
gray = rgb2gray(a);
[ele, new] = myEntropy(gray);
 entro (new)
 8/entro (new)
d = entro(new) ;
a = imread('lena.jpg');
img = rgb2ycbcr(a);
y= img(:,:,1);
cb= img(: , :,2);
cr = img(:, :, 3);
[e_y, i_y] = myEntropy(y);
[e_y, i_cb] = myEntropy(cb);
[cr , i_cr] = myEntropy(cr);
entro(i_y)
entro(i_cb)
entro(i_cr)
8/entro(i_y)
8/entro(i_cb)
8/entro(i_cr)


%% 

 X = 'HUFFMAN IS THE BEST COMPRESSION ALGORITHM';




[seq, book, tree] = HuffmanCode(X);
seq
book
tree
back = Decode(tree, seq);
back = cellfun(@char,back,'un',0);
%%
X = imread('lena.jpg');
redChannel = X(1,:,1);
[seq, book, tree] = HuffmanCode(redChannel);
seq
book 
tree
%for j = 1:220 
 %   redChannel = X(j,:,1);
  %  [seq, book, tree] = HuffmanCode(redChannel);
   % back = Decode(tree, seq);
    %back = cell2mat( cellfun(@uint8,back,'un',0));
    %red (j, :) = back;
%end
%for j = 1:220 
 %   blueChannel = X(j,:,2);
  %  [seq, book, tree] = HuffmanCode(blueChannel);
   % back = Decode(tree, seq);
    %back = cell2mat( cellfun(@uint8,back,'un',0));
    %blue (j, :) = back;
%end
%for j = 1:220 
 %   greenChannel = X(j,:,3);
  %  [seq, book, tree] = HuffmanCode(greenChannel);
   % back = Decode(tree, seq);
    %back = cell2mat( cellfun(@uint8,back,'un',0));
    %green (j, :) = back;
%end
%image = cat(3,red, blue, green);
%imshow(image);