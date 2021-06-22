i = imread('10.jpg');
% convert to grayscale
i = rgb2gray(i);

% normalise
r = double(i)/255;

%% log transform
s = log(r+1);

%% plot
subplot(1,2,1), imshow(uint8(i)), title('Original');
subplot(1,2,2), imshow(s), title('Log Transformed');