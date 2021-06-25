img = imread('bw1.jpg');
img = rgb2gray(img);
imhist(img);

%% taking one object

threshold = 25;
% new white canvas of same size as image
obj = ones(size(img)).*255;
% set pixel value < threshold as 0
obj(img<threshold) = 0;

%% plot
figure
subplot(1,2,1), imshow(img), title('Original');
str = sprintf('Object with threshold %i', threshold);
subplot(1,2,2), imshow(obj), title(str);