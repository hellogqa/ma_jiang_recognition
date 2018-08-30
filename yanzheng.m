close all; 
clear; 
clc; 


% read image
[filename, pathname, filterindex] = uigetfile('F:\MATLAB_code\mj_rec\majhon\*.jpg', 'ѡ��������ͼƬ');
file = fullfile(pathname, filename); 
I = imread(file); 
figure(1), imshow(I), title('ԭʼͼ��'); 

I1 = preProcess(I); 
yanzI = extract(I1); % ��ȡ����֤ͼ��
figure(2), imshow(yanzI), title('��֤ͼ��'); 

tic; 
for i = 1:43
    zhucI = imread(strcat('F:\MATLAB_code\mj_rec\muban\', num2str(i), '.jpg'));
    Differ = yanzI - imbinarize(zhucI);
    compare(i) = sum(sum(abs(Differ)));
end

index = find(compare == min(compare)); 

char = result(index); 
msgbox( ['�����齫�ǣ�', char], '���'); 
toc; 
