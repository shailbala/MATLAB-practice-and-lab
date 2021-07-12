function [neighbour] = getNeighbours(id, img, n)
% n can be 4 or 8, no. of neighbours
% returns n valid neighbours as a matrix of max size nX2
% id is a vector of size 2
i = id(1);  j = id(2);
% top, down, left, right are always present
neighbour = [i-1 j; i+1 j; i j-1; i j+1];

% 4 diagonal neighbours
neighbr_diag = [i-1 j-1; i-1 j+1; i+1 j-1; i+1 j+1];

if n==8
    % add diagonal ids
    neighbour = [neighbour; neighbr_diag];
end

% check validity of indices, should be >0 and <=size
% remove all rows with 1st col value <1 or >size(img,1)
neighbour = neighbour(~(neighbour(:,1)<1 | neighbour(:,1)>size(img,1)), :);
% remove all rows with 2nd col value <1 or >size(img,2)
neighbour = neighbour(~(neighbour(:,2)<1 | neighbour(:,2)>size(img,2)), :);
% return neighbour
%disp('Inside function getNeighbours');
%disp(neighbour);
end