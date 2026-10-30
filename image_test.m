clc;
clear;
close all;

I = uint8(repmat(0:255,256,1));
J = 255 - I;

figure;

subplot(1,2,1);
imshow(I);
title('Original Image');

subplot(1,2,2);
imshow(J);
title('Negative Image');