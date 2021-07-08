path_input = 'path\';
path_output = 'path2\'
f = dir(path);
f
f.name
s = size(f);

for i=1:s(1)-2
    filename = strcat(path_input, 'a', num2str(i),'.jpg');
    j = imread(filename);
    
%     k = rgb2gray(j);
%     output_folder = strcat(path_output, 'a', num2str(i), '.jpg');
%     imwrite(k, output_folder, 'jpg');
end
