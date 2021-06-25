
img = imread('bw3.png');
img = rgb2gray(img);
imhist(img);

%% taking two objects

t1 = 130;
t2 = 180;

% new white canvas of same size as image
obj1 = ones(size(img)).*255;
obj2 = ones(size(img)).*255;

% set pixel value < t1 threshold as 0
obj1(img<t1) = 0;

% set pixel value > t1, < t2 threshold as 0
idx = find((img<t2) & (img >t1));
obj2(idx) = 0;

%% plot
figure
subplot(2,2,1), imshow(img), title('Original');
str1 = sprintf('Object 1 with threshold %i', t1);
str2 = sprintf('Object 2 with threshold %i', t2);
subplot(2,2,3), imshow(obj1), title(str1);
subplot(2,2,4), imshow(obj2), title(str2);