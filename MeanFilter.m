
clc;
clear;
close all;

I = uint8(repmat(0:255,256,1));

I(100:150,100:150) = 255;

A = double(I);
B = zeros(size(A));

for i = 2:255
    for j = 2:255
        B(i,j) = mean(mean(A(i-1:i+1,j-1:j+1)));
    end
end

J = uint8(B);

figure;

subplot(1,2,1);
imagesc(I);
colormap(gray(256));
axis image off;
title('Original Image');

subplot(1,2,2);
imagesc(J);
colormap(gray(256));
axis image off;
title('Mean Filtered Image');
