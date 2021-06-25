% read image
I = imread('bw3.png');
% grayscale
I = rgb2gray(I);
imshow(I);

% find connected components in BW image
BW = imbinarize(I);
% imshow(BW)    %gives black image

CC = bwconncomp(BW);
%   struct with fields: 
%     Connectivity: 8
%        ImageSize: [308 268]
%       NumObjects: 1
%     PixelIdxList: {[75801×1 double]}

% same size as image
% creates unique labels (int) for each connected component
L = labelmatrix(CC);

% label2rgb(L, optional(cmap, zerocolor, order, outputFormat))
% L     Label Image Matrix
% cmap  color map, c-by-3 matrix of type double, 'parula' 'turbo'
% 'hsv', 'hot', 'cool', 'spring', 'summer', 'autumn', 'winter'
% 'gray', 'bone', 'copper', 'pink', 'jet', 'lines', 'prism', 'flag'
% zerocolor    Fill color, RGB triplet, default white, 'b', 'c', 'g', 'k',
% 'm', 'r', 'w', 'y'
% order     color order, default 'noshuffle'
% outputFormat defual 'image'| 'triplets'-list of RGB colours

RGB = label2rgb(L);
figure
imshow(RGB);
% colormap spring, fill (background) with cyan, shuffle colours
RGB2 = label2rgb(L, 'spring', 'c', 'shuffle');
figure
imshow(RGB2);
% numel finds the number of elements in a cell/array
% cellfun applies the @function to every cell
% find the total no. of pixels in each component
numPixels = cellfun(@numel, CC.PixelIdxList);
% find the ids with maximum pixels (biggest component)
[biggest, idx] = max(numPixels);

%% do something with this component
BW(CC.PixelIdxList{idx}) = 0;
figure
imshow(BW);
