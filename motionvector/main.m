video = VideoReader('BirdNoSound.mp4');
fram1 = readFrame(video);
fram2 = readFrame(video);
fram3 = readFrame(video);
fram4 = readFrame(video);
fram5 = readFrame(video);
fram6 = readFrame(video);
fram7 = readFrame(video);
fram8 = readFrame(video);
fram2 = rgb2gray(fram2);
fram3 = rgb2gray(fram3);
d = size(fram3);
row = ceil(d(1) /16);
col = ceil(d(2) /16);
i =1;

 for x = 1: col
       for y = 1: row
          
          for rx = 1 : 16
              for ry = 1: 16
                  if((x*16+rx) < d(1) &(y*16+ry) < d(2))
                   block(rx,ry,i) = fram3(rx+x*16,ry+y*16);
                  else
                   block(rx,ry,i) = 0;
                     
                  end
              end
          end
        
          i= i+1;
          
       end
 end
for x = 0: row-1
       for y = 0: col-1

           [i,j] = computeMotionVect(fram2,fram3, x*16+1, y*16+1, 7);
           
           r(x+1,y+1,1) = i ;
           r(x+1,y+1,2) = j ;
       end
end
for x = 0: row-2
       for y = 0: col-1
     
      
          re (16*x+1:16*x+16,16*y+1:16*y+16)=  fram2(r(x+1,y+1,1):r(x+1,y+1,1)+15,r(x+1,y+1,2): r(x+1,y+1,2)+15);
       end
end
differ1 = fram2 -fram3;
entro = entropy(differ1);

diff =  re(1:1080:1:1920)-fram3;
entro1 = entropy(diff);

%%
pic1 = imread('pic1.jpg');
pic2 = imread('pic2.jpg');
pic3 = imread('pic3.jpg');
pic4 = imread('pic4.jpg');
pic5 = imread('pic5.jpg');
pic1 = rgb2hsv(pic1);
pic2 = rgb2hsv(pic2);
pic3 = rgb2hsv(pic3);
pic4 = rgb2hsv(pic4);
pic5 = rgb2hsv(pic5);
h = pic1(:,:,1);
s = pic1(:,:,2);
v = pic1(:,:,3);
data1 = vector(h,'h');
datas1 = vector(s,'s');
datav1 = vector(v,'v');
pic1data = [data1 datas1 datav1];
h = pic2(:,:,1);
s = pic2(:,:,2);
v = pic2(:,:,3);
data2 = vector(h,'h');
datas2 = vector(s,'s');
datav2 = vector(v,'v');
pic2data = [data2 datas2 datav2];
h = pic3(:,:,1);
s = pic3(:,:,2);
v = pic3(:,:,3);
data2 = vector(h,'h');
datas2 = vector(s,'s');
datav2 = vector(v,'v');
pic3data = [data2 datas2 datav2];
h = pic4(:,:,1);
s = pic4(:,:,2);
v = pic4(:,:,3);
data2 = vector(h,'h');
datas2 = vector(s,'s');
datav2 = vector(v,'v');
pic4data = [data2 datas2 datav2];
h = pic5(:,:,1);
s = pic5(:,:,2);
v = pic5(:,:,3);
data2 = vector(h,'h');
datas2 = vector(s,'s');
datav2 = vector(v,'v');
pic5data = [data2 datas2 datav2];
diff=manhattan(pic1data,pic2data);
diff1=manhattan(pic1data,pic3data);
diff4=manhattan(pic1data,pic4data);
diff5=manhattan(pic1data,pic5data);