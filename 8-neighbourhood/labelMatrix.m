%% produce labelMatrix, similar to standard labelMatrix

% read a BW image
img1 = imread('obj3.jpg');
img1 = rgb2gray(img1);
img1 = imbinarize(img1);
% plot histogram to confirm this
%imhist(img1);

% chand tara
img2 = imread('bw3.png');
img2 = rgb2gray(img2);
obj1 = ones(size(img2)).*255;
obj1(img2<180) = 0;
img2 = obj1;

img3 = [0 1 1 1 1 1 1 0; 1 1 0 0 0 0 1 1;  1 1 0 0 0 0 0 1;  1 0 0 0 0 0 1 1];
img3 = [img3; 1 1 0 0 0 0 1 1; 1 1 1 0 1 1 1 1; 1 1 1 1 1 1 1 1];

%% 3 images we have
% 8-neighbourhood
neighbour = 8;
% minimum size of component, atleast 2 pixels
minSize = 10;

% img1 = panda with atleast 4 components
% img2 = 2 components (moon, star)
% img3 = custom small 7x8 with one big component, 2 components of size 1

% ::::::::::::::::::::::img 1::::::::::::::::::::::
[biggestComponent1, labelMat1, componentMat1] = processImage(img1, neighbour, minSize);
%
RGB = label2rgb(labelMat1);
subplot(3,2,1), imshow(RGB), title('All components in diff colours');
% plot
subplot(3,2,2), imshow(biggestComponent1), title('Biggest Component');

% ::::::::::::::::::::::img 2::::::::::::::::::::::
[biggestC2, labelMat2, componentMat2] = processImage(img2, neighbour, minSize);
%
RGB = label2rgb(labelMat2);
subplot(3,2,3), imshow(RGB), title('All components in diff colours');
% plot
subplot(3,2,4), imshow(biggestC2), title('Biggest Component');

% ::::::::::::::::::::::img 3::::::::::::::::::::::
[biggestC3, labelMat3, componentMat3] = processImage(img3, neighbour, 10);
%
RGB = label2rgb(labelMat3);
subplot(3,2,5), imshow(RGB), title('All components in diff colours');
% plot
subplot(3,2,6), imshow(biggestC3), title('Biggest Component');

%% shifted in function processImage
% n=8;
% % track no. of components found here, used for labelling
% components = 0;
% % label matrix, initially all zeroes
% label = zeros(size(img));
% % 
% visited = zeros(size(img));
% for i=1:size(img,1)
%    for j=1:size(img,2)
%       % find an unvisited, black pixel
%       % a new component begins
%       if (img(i,j) == 0 && visited(i,j) == 0)
%           % mark it visited
%           visited(i,j) = 1;
%           [ids, visited] = find_component([i j], img, n, visited, minSize);
%           if size(ids)
%               components = components + 1;
%               %ids
%               %visited
%               % add a new label to the indices
%               idx = sub2ind(size(label),ids(:,1),ids(:,2));
%               label(idx) = components;
%               size(label)
%           end
%       end
%    end
% end
% 
% % RGB = label2rgb(label);
% % figure
% % imshow(RGB);
% 
% % vector to store the size of each component
% cSize = zeros(1, components);
% for i=1:components
%     cSize(i) = sum(sum(sum(label==i)));
% end
% % find biggest component
% biggest = find(cSize==max(cSize));
% % separate and show
% cMatrix = ones(size(img));
% cMatrix(label==biggest) = 0;
% %imshow(cMatrix);
% imshow(cMatrix);
% title('Biggest Component');
% 
% % create a 3-d matrix for each component
% cMatrix = ones(size(img)).*255;
% % first component
% cMatrix(label==1) = 0;
% components
% % add each new component as a new page
% for i=2:size(components)+1
%      new = ones(size(img)).*255;
%     new(label==i) = 0;
%     cMatrix(:,:,i) = new;
% end
% 
% size(cMatrix)
% figure
% imshow(cMatrix(:,:,1));
% figure
% imshow(cMatrix(:,:,2));