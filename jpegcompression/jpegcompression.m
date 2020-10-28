a = imread('lena.jpg');

gray  = rgb2gray(a);














block = divideimg(gray);


quan = quantround(block);

requan = dequantround(quan);



recon = combineimg(requan);
recon8 = uint8(recon);
imshow(recon8)