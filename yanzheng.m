close all; 
clear; 
clc; 


% read image
[filename, pathname, filterindex] = uigetfile('F:\MATLAB_code\mj_rec\majhon\*.jpg', '选择待处理的图片');
file = fullfile(pathname, filename); 
I = imread(file); 
figure(1), imshow(I), title('原始图像'); 

I1 = preProcess(I); 
yanzI = extract(I1); % 提取的验证图像
figure(2), imshow(yanzI), title('验证图像'); 

tic; 
for i = 1:43
    zhucI = imread(strcat('F:\MATLAB_code\mj_rec\muban\', num2str(i), '.jpg'));
    Differ = yanzI - imbinarize(zhucI);
    compare(i) = sum(sum(abs(Differ)));
end

index = find(compare == min(compare)); 

char = result(index); 
msgbox( ['这张麻将是：', char], '结果'); 
toc; 
