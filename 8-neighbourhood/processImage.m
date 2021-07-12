function [biggestComponent, labelMat, componentMat] = processImage(img, neighbour, minSize)
% input: binarized image, neighbour=4 or 8
% minSize of a component (2,10 etc.)

%% produce labelMatrix, similar to standard labelMatrix
% % 8-neighbourhood
% neighbour = 8;
% minimum size of component, atleast 2 pixels
%minSize = 10;

%img = [0 1 1 1 1 1 1 0; 1 1 0 0 0 0 1 1;  1 1 0 0 0 0 0 1;  1 0 0 0 0 0 1 1];
%img = [img; 1 1 0 0 0 0 1 1; 1 1 1 0 1 1 1 1; 1 1 1 1 1 1 1 1];

% track no. of components found here, used for labelling
components = 0;
% label matrix, initially all zeroes
labelMat = zeros(size(img));
% 
visited = zeros(size(img));
for i=1:size(img,1)
   for j=1:size(img,2)
      % find an unvisited, black pixel
      % a new component begins
      if (img(i,j) == 0 && visited(i,j) == 0)
          % mark it visited
          visited(i,j) = 1;
          [ids, visited] = find_component([i j], img, neighbour, visited, minSize);
          if size(ids)
              components = components + 1;
              %ids
              %visited
              % add a new label to the indices
              idx = sub2ind(size(labelMat),ids(:,1),ids(:,2));
              labelMat(idx) = components;
              size(labelMat)
          end
      end
   end
end

% vector to store the size of each component
cSize = zeros(1, components);
for i=1:components
    cSize(i) = sum(sum(sum(labelMat==i)));
end
% find biggest component
biggest = find(cSize==max(cSize));
% separate and show
biggestComponent = ones(size(img));
biggestComponent(labelMat==biggest) = 0;

% create a 3-d matrix for each component
componentMat = ones(size(img)).*255;
% first component
componentMat(labelMat==1) = 0;

% add each new component as a new page
for i=2:size(components)+1
     new = ones(size(img)).*255;
    new(labelMat==i) = 0;
    componentMat(:,:,i) = new;
end

size(componentMat);

end