% input folder
in_path = '/home/MATLAB/vid/';
% output folder
out_path = '/home/MATLAB/vidOutput/';
f = dir(in_path);
% total number of objects at the dir + 2 (. and ..)
s = size(f,1);

% for mean intensity, number of rows=number of images
% 3 columns for 3 channels (RGB)
intensity = zeros(s-2,3);
% for histogram, number of rows=3 (RGB), columns = 0-255
% pages = no. of images
histo = zeros(3,256,s-2);

for i=1:s-2
    filename = strcat(in_path, 'a', num2str(i),'.jpg');
    img = imread(filename);
    
    % intensity
    % all 3 planes
    % find mean, [1 2] is mean along the dimensions 1 and 2
    intensity(i, :) = mean(img, [1 2]);
    
    % string to display intensity
%     str = strcat('Red, Green, Blue mean intensity of image ', num2str(i), ':');
%     disp(str);
%     disp(intensity(i,:));

    % histogram
    % for each pixel intensity, find the count
    for pixel=1:256
        % the index starts from 1, but pixel intensity starts with 0
        % so a-1 for counting purpose
        red = 1;green=2;blue=3;
        % Red
        histo(red,pixel,i) = sum(sum(img(:,:,red)==(pixel-1)));
        
        % Green
        histo(green,pixel,i) = sum(sum(img(:,:,green)==(pixel-1)));
        
        % Blue
        histo(blue,pixel,i) = sum(sum(img(:,:,blue)==(pixel-1)));
    end
    histogram
    subplot(2,2,1);
    imshow(img);
    title('10th (Original) Image');
    
    subplot(2,2,2);
    histogram(img(:,:,1));
    title('Channel: Red');
    
    subplot(2,2,3);
    histogram(img(:,:,2));
    title('Channel: Green');
    
    subplot(2,2,4);
    histogram(img(:,:,3));
    title('Channel: Blue');
    
    % hsv conversion
    k = rgb2hsv(img);
    % for writing purpose
    output_name = strcat(out_path, 'hsv', num2str(i), '.jpg');
    imwrite(k, output_name, 'jpg');
end
