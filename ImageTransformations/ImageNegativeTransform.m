i = imread('negative.png');
% convert to grayscale
i = rgb2gray(i);

% normalise
r = double(i)/255;

%% image negative transform
% matrix r has values between 0 and 1
s = 1 - r;

%% plot
subplot(1,2,1), imshow(uint8(i)), title('Original');
subplot(1,2,2), imshow(s), title('Image Negative Transformed');