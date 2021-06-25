i = imread('0.jpg');
% convert to grayscale
i = rgb2gray(i);

% normalise
r = double(i)/255;
c = 1;
%
gamma = 0.4;


s = c*(r).^gamma;
subplot(1,2,1), imshow(uint8(i)), title('Original');
subplot(1,2,2), imshow(s), title('Power Law Transformed, gamma=0.4');