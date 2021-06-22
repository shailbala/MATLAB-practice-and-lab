%%  WAP to take n input 1D matrix and compute the histogram of it.
%   Plot the histogram using the bar graph.
% [1,1,1,2,2,4,4,4,5,1,6,3,3,7,1,8,5,8];
% [5,2,2,3,2,1,1,2,0,0]

%% Input
arr = input('Input the values: ');
%arr = [1 1 1 2 2 4 4 4 5 1 6 3 3 7 1 8 5 8 10 50];
%arr = [1,1,1,2,2,4,4,4,5,1,6,3,3,7,1,8,5,8];
%arr = [5,2,2,3,2,1,1,2,0,0];
count = [];
unique = [];
arr = sort(arr);

%% Count the frequency and store each unique value
for i=min(arr):max(arr)
    count(i) = sum(arr==i);
    % each unique eleemnt
    unique(i) = i;
end
%count;
bar(unique,count)
%histogram(arr);