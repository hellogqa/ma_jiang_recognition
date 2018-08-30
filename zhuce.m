close all; 
clear; 
clc; 

% ����ͼ��
[filename, pathname, filterindex] = uigetfile('F:\MATLAB_code\mj_rec\majhon\*.jpg', 'ѡ��������ͼƬ'); 
file = fullfile(pathname, filename); 
I = imread(file); 
% figure(1), imshow(I), title('Original image'); 

% ��ɫͼ��ת�Ҷ�ͼ��
I1 = rgb2gray(I); 
% figure(2), imshow(I1), title('Gray image'); 

% ��Ե�ü�
[m, n] = size(I1); 
r = round(m/10); 
c = round(n/10);
I2 = I1(r:(9*r), c:(9*c));
% figure(3), imshow(I2), title('Gray image');  % �����Ĵ�����I2�Ͻ���

% ��ֵ������
level = graythresh(I2);
I3 = imbinarize(I2, level); 
I3 = ~I3; 
figure(4), imshow(I3), title('Binary image'); 

% �˹��ü���ȥ��50�������µ�С�߿�
I4 = double(imcrop(I3));
I4 = bwareaopen(I4, 50);

% ��ȡͼ��
[y, x] = size(I4); 
V_y = zeros(y, 1); 
for i = 1:y
    for j = 1:x
       if I4(i,j) == 1
           V_y(i,1) = V_y(i,1) + 1; 
       end
    end
end
PY1 = 1; 
while (V_y(PY1,1)<20) && (PY1<y)
    PY1 = PY1 + 1; 
end
PY2 = y;
while (V_y(PY2,1)<20) && (PY2>PY1)
    PY2 = PY2 - 1; 
end
V_x = zeros(1, x); 
for  j = 1:x
    for i = 1:y
       if I4(i,j) == 1
           V_x(1,j) = V_x(1,j) + 1; 
       end
    end
end
PX1 = 1;
while (V_x(1,PX1)<20) && (PX1<x)
    PX1 = PX1 + 1; 
end
PX2 = x;
while (V_x(1,PX2)<20) && (PX2>PX1)
    PX2 = PX2 - 1; 
end
I4 = I4(PY1:PY2, PX1:PX2); 
I5 = imresize(I4, [160, 120]); % ��ͼ���һ��Ϊ160��120

figure(5), imshow(I5), title('Crop image'); 
imwrite(I5, 'F:\MATLAB_code\mj_rec\muban\*.jpg'); % ���ݶ����ͼ��仯���仯









