i = imread('15.jpg');
% convert to grayscale
i = rgb2gray(i);

% normalise
r = double(i)/255;

%% e^x transform
s = exp(r);
% normalise, the values may become >1
s = s./2.71828;

%% plot
subplot(1,2,1), imshow(uint8(i)), title('Original');
subplot(1,2,2), imshow(s), title('e^x Transformed');
