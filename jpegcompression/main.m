%%part1
a = imread('lena.jpg');

gray  = rgb2gray(a);

%%part1.2
part4 = sample(gray, 4);
grayimage4 = dct2(part4);
y4 = log(abs (grayimage4));
y4 = reshape(y4,1,[]);
histogram(y4);


part8 = sample(gray, 8);
grayimage8 = dct2(part8);
y8 = log(abs (grayimage8));
y8 = reshape(y8,1,[]);
histogram(y8);

part32 = sample(gray, 32);
grayimage32 = dct2(part32);
y32 = log(abs (grayimage32));
y32 = reshape(y32,1,[]);
%histogram(y32);

%%part1.3

reverse4 = idct2(grayimage4);
reverse8 = idct2(grayimage8);
reverse32 = idct2(grayimage32);
%%4
dczero = zero(grayimage8,0);
reversedc = idct2(dczero);
lowzero = zero(grayimage8,1);
reverselow = idct2(lowzero);
highzero = zero(grayimage8,2);
reversehigh = idct2(highzero);
diff = double(part8) - reversehigh;
%%51
block = divideimg(gray);

%%6
quan = quantround(block);
requan = dequantround(quan);



recon = combineimg(requan);
recon = uint8(recon);
err = immse(recon, gray);
sig = snr(recon, gray);
peaksnr = psnr(recon, gray);
%%Lab 2 Part 2
video = VideoReader('BirdNoSound.mp4');
fram1 = readFrame(video);
fram2 = readFrame(video);
fram3 = readFrame(video);
fram4 = readFrame(video);
fram5 = readFrame(video);
fram6 = readFrame(video);
fram7 = readFrame(video);
fram8 = readFrame(video);
fram9 = readFrame(video);
fram10 = readFrame(video);
fram11= readFrame(video);
%gray scale
fram1 = rgb2gray(fram1);
fram2 = rgb2gray(fram2);
fram3 = rgb2gray(fram3);
fram4 = rgb2gray(fram4);
fram5 = rgb2gray(fram5);
fram6 = rgb2gray(fram6);
fram7 = rgb2gray(fram7);
fram8 = rgb2gray(fram8);
fram9 = rgb2gray(fram9);
fram10 = rgb2gray(fram10);
fram11 = rgb2gray(fram11);
%difference
differ1 = fram1-fram2;
differ2 = fram2-fram3;
differ3 = fram3-fram4;
differ4 = fram4-fram5;
differ5 = fram5-fram6;
differ6 = fram6-fram7;
differ7 = fram7-fram8;
differ8 = fram8-fram9;
differ9 = fram9-fram10;
differ10 = fram10-fram11;

%entropy 
entro(1) = entropy(differ1);
entro(2) = entropy(differ2);
entro(3)= entropy(differ3);
entro(4) = entropy(differ4);
entro(5) = entropy(differ5);
entro(6) = entropy(differ6);
entro(7) = entropy(differ7);
entro(8) = entropy(differ8);
entro(9) = entropy(differ9);
entro(10) = entropy(differ10);
%framepre = DPCM(fram1,1);
%framepre2 = DPCM(fram1,2);
%framepre3 = DPCM(fram1,3);
%framepre4 = DPCM(fram1,4);
oentro(1) = entropy(fram1);
oentro(2) = entropy(fram2);
oentro(3)= entropy(fram3);
oentro(4) = entropy(fram4);
oentro(5) = entropy(fram5);
oentro(6) = entropy(fram6);
oentro(7) = entropy(fram7);
oentro(8) = entropy(fram8);
oentro(9) = entropy(fram9);
oentro(10) = entropy(fram10);
compression = 8*10/ (sum(entro(1:9))+8)
x = 1:10;
plot(x, entro);
histogram(oentro);
histogram(entro);
imshow(differ1)

