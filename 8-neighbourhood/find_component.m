function [ids, visited] = find_component(id, img, n, visited, minSize)
% finds one connected component with id as one pixel in it
% minSize is the threshold size for component
% if component size found < minSize, returns ids = [] and visited
% returns:
% ids: indices of pixel which form a single component with id as its part

ids = id;
% the LIFO stack for dfs
neighbour = getNeighbours(id, img, n);
neighbours = [];
% add only unvisited, black neighbours
for i=1:size(neighbour,1)
    j = neighbour(i,1);
    c = neighbour(i,2);
    if visited(j,c) == 0 && img(j,c) == 0
        % unvisited, add to neighbours
        neighbours = [neighbours; j c];
        % mark them visited
        visited(j,c) = 1;
    end
end

s = size(neighbours);
%m = 0;
% disp('Size of neighbours');
% disp(s);
%%::::::::::::::::::::Iterative Version::::::::::::::::::::::
while s
   %disp('Inside loop, new iter!');
   %disp(m);
   %m = m+1;
   % last row, remove from neighbours
   curr_id = neighbours(s(1),:);
   i = curr_id(1);  j = curr_id(2);
   neighbours(s(1),:) = [];
   % generate all valid neighbours, if this pixel is unvisited and black
   % add to stack
       neighbour = getNeighbours([i j], img, n);
       % add only unvisited to stack
       for a=1:size(neighbour,1)
           b = neighbour(a,1);
           c = neighbour(a,2);
                if visited(b,c) == 0 && img(b,c) == 0
                    % unvisited, add to neighbours
                    neighbours = [neighbours; b c];
                    % mark them visited
                    visited(b,c) = 1;
            end
        end
%        % mark this pixel as visited
%        visited(i,j) = 1;
       % add it to ids
       ids = [ids; i j];
   s = size(neighbours);
end


% check for min size, using numel function
if numel(ids(:,1)) < minSize
    ids = [];
end

% return
disp('Inside find_component');
ids;
visited;
end
