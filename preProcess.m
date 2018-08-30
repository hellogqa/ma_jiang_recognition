function dst = preProcess(src)
% PREPROCESS ‘§¥¶¿Ì

I1 = rgb2gray(src); 
[m, n] =size(I1); 
r = round(m/10); 
c = round(n/10);
I1 = I1(r:(9*r), c:(9*c));
level = graythresh(I1); 
I2 = imbinarize(I1, level);
I3 = ~I2; 
I4 = double(imcrop(I3)); 
I5 = bwareaopen(I4, 50);
dst = I5; 