path = '/home/iota/Documents/00Notes/MATLAB/vid';
f = dir(path);
f
f.name
s = size(f);

for i=1:s(1)-2
    filename = strcat('/home/iota/Documents/00Notes/MATLAB/vid/a', num2str(i),'.jpg');
    j = imread(filename);
    
%     k = rgb2gray(j);
%     output_folder = strcat('/home/iota/Documents/00Notes/MATLAB/vidOutput/a', num2str(i), '.jpg');
%     imwrite(k, output_folder, 'jpg');
end
