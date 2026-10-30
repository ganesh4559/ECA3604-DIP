clc;
clear;
close all;

[file, path] = uigetfile({'*.jpg;*.png;*.jpeg;*.bmp', 'Image Files'});

if isequal(file, 0)
    disp('No image selected');
    return;
end

I = imread(fullfile(path, file));

G = uint8(0.299*double(I(:,:,1)) + ...
    0.587*double(I(:,:,2)) + ...
    0.114*double(I(:,:,3)));

C = uint8(max(0,min(255, ...
    (double(I)-0.3*255)*255/(0.7*255-0.3*255))));

H = uint8(max(0,min(255, ...
    (double(G)-0.3*255)*255/(0.7*255-0.3*255))));

subplot(2,2,1);
image(I);
axis image off;
title('Original Color');

subplot(2,2,2);
image(C);
axis image off;
title('Enhanced Color');

subplot(2,2,3);
imagesc(G);
colormap(gray(256));
axis image off;
title('Original Gray');

subplot(2,2,4);
imagesc(H);
colormap(gray(256));
axis image off;
title('Enhanced Gray');