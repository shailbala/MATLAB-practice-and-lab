%i = imread('10.jpg');

i = imread('negative.png');
% convert to grayscale
i = rgb2gray(i);

% normalise
r = double(i)/255;

%% 2^x transform
% values may be > 1, normalise
s = (2.^r)./2;

%% plot
subplot(1,2,1), imshow(uint8(i)), title('Original');
subplot(1,2,2), imshow(s), title('2^x Transformed');