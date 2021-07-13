% :::::::::::::::::::
% :::::::::::::::::::user input:::::::::::::::::::

%K = input('Enter number of clusters:');
K = 3;
%data = input('Enter data');
%data = (10:20)';
data = [1 2; 3 4; 4 5; 7 9; 6 8; 5 7; 1 3; 1 4; 2 3; 2 4; 6 7; 5 8; 6 9; 5 5];

% :::::::::::::::::::Intermediate Values:::::::::::::::::::

% number of dimensions of data
dim = size(data,2);
% size of data
n = size(data,1);

% :::::::::::::::::::Output:::::::::::::::::::
% Centroids, C [K x dim]
% Membership Matrix, MMatrix [n x K]

% :::::::::::::::::::Initialize:::::::::::::::::::
% randomly K data points as initial centroids
index = randperm(n, K);
C_new = zeros(K,dim);
for i=1:K
    C_new(i, :) = data(index(i),:);
end
%C_new
m = 1;
distMatrix = generateDistanceMatrix(data, C_new);
membership = getMembership(distMatrix, m);
% all zeroes to start with
C = zeros(K, dim);
error = 0.001;
colours = ['.r', '.c', '.b', '.g', '.m', '.y'];

% :::::::::::::::::::Working:::::::::::::::::::
while abs(C_new-C) >= error
    %disp('Outside Function');
    % store prev Centroids, find new set
    C = C_new;
    %membership
    % update centroids
    C_new = updateCentroid(data, membership, C, m);
    % update distance
    distMatrix = generateDistanceMatrix(data, C);
    % update membership
    membership = getMembership(distMatrix, m);
end

% for plots
disp('Hard Clusters based on closeness to one centroid:');
hard_cluster = getHardCluster(membership);
disp(hard_cluster);
%C_new

% Scatter Plot
for i=1:K
    d = data(hard_cluster==i, :);
    x = d(:,1);
    y = d(:,dim);
    scatter(x, y, [], rand(1,3), 'filled');
    hold on;
end
% show the centroids as well
C_x = C_new(:,1);
if dim >1
    C_y = C_new(:,2);
else
    C_y = [0];
end
scatter(C_x, C_y, [], '.r', 'marker', '*');
hold on;


% Function Test Cases
%{
d = [1 2; 4 1; 9 18; 1 5];
m = 1;
expected_result = [0.6667,0.3333;0.2000,0.8000;0.6667,0.3333;0.8333,0.1667];
updateMembership(d, m);
%}

% :::::::::::::::::::Functions:::::::::::::::::::
function d = distance(x,y)
% finds distance between 2 data points if they are of same dimension, else
% returns -1
% distance = |x-y|, if ndim = 1
%      TODO: sqrt(sum(xi^2-yi^2)), if ndim > 1
%     x
%     y
%     abs(x-y)
    d = sum(abs(x-y));
end

function MMatrix = getMembership(distMatrix, m)
    MMatrix = zeros(size(distMatrix));
    for i=1:size(distMatrix,1)
        % summation(1/Dik)
        s = sum(1./distMatrix(i, :));
       for j=1:size(distMatrix,2)
           MMatrix(i,j) = (1./distMatrix(i,j).^(2/m-1)).*(1./s);
           if isnan(MMatrix(i,j))
               %distMatrix
               % overlapping points cause NaN, which should be 1
               MMatrix(i,j) = 1;
           end
       end
    end
end

function cluster = getHardCluster(MMatrix)
cluster = zeros(size(MMatrix,1), 1);
% get index of maximum element in each row
for i=1:size(cluster)
    cluster(i) = find(MMatrix(i,:) == max(MMatrix(i,:)));
end
end

function Cnew = updateCentroid(data, MMatrix, C, m)
MMatrix = MMatrix.^m;
Cnew = zeros(size(C));
%data
% disp('Size of MMatrix:');
% disp(size(MMatrix));
% disp('Size of Cnew:');
% disp(size(Cnew));

    for i=1:size(C,1)
        Cnew(i,:) = sum(MMatrix(:,i).*data)/sum(MMatrix(:,i));
    end
end

function distMatrix = generateDistanceMatrix(data, C)
% returns the matrix of size nxK
% where A(i,j) gives distance b/w ith data and jth cluster
% n = number of input data (rows)
% K = number of Centroids = size(C,1)
%C
    distMatrix = zeros(size(data,1),size(C,1));
    for i=1:size(distMatrix,1)
        for j=1:size(distMatrix,2)
            distMatrix(i,j) = distance(data(i, :), C(j, :));
        end
    end
end