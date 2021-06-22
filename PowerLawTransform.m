%i = imread('0.jpg');
i = imread('whitePluto.png');
% convert to grayscale
i = rgb2gray(i);

% normalise
r = double(i)/255;
c = 1;

%% power law transform, gamma > 1 for dark, gamma < 1 for bright
gamma = 2.4;
% apply transform
s = c*(r).^gamma;

%% plot
subplot(1,2,1), imshow(uint8(i)), title('Original');
subplot(1,2,2), imshow(s), title('Power Law Transformed: gamma=0.4');