
clc;
clear;
close all;

I = imread('peppers.png');

I = rgb2gray(I);

J = 255 - I;

subplot(1,2,1);
imshow(I);
title('Original Grayscale Image');

subplot(1,2,2);
imshow(J);
title('Negative Image');

imwrite(J,'negative_image.png');
