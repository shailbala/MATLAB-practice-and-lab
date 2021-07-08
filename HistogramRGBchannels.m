path = 'path\';
f = dir(path);
% total number of objects at the dir + 2 (. and ..)
s = size(f,1);

%% for one image only
filename = strcat(path, '/a11','.jpg');
img = imread(filename);
subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
histogram(img(:,:,1));
title('Channel: Red');

subplot(2,2,3);
histogram(img(:,:,2));
title('Channel: Green');

subplot(2,2,4);
histogram(img(:,:,3));
title('Channel: Blue');
