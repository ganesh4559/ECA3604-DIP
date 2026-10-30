clc;
clear;
close all;

I = imread('photo.jpg');
G = rgb2gray(I);

subplot(1,2,1);
imshow(I);
title('Color Image');

subplot(1,2,2);
imshow(G);
title('Gray Image');