
clc;
clear;
close all;

A = peaks(256);
A = (A - min(A(:))) / (max(A(:)) - min(A(:)));
I = uint8(100 + 50 * A);

h = zeros(256,1);

for k = 0:255
    h(k+1) = sum(I(:) == k);
end

cdf = cumsum(h);
cdfmin = min(cdf(cdf > 0));

T = round((cdf - cdfmin) * 255 / (numel(I) - cdfmin));
T = max(0, min(255, T));

J = uint8(T(double(I)+1));

h2 = zeros(256,1);

for k = 0:255
    h2(k+1) = sum(J(:) == k);
end

subplot(2,2,1);
imagesc(I,[0 255]);
colormap(gray(256));
axis image off;
title('Low Contrast Image');

subplot(2,2,2);
imagesc(J,[0 255]);
colormap(gray(256));
axis image off;
title('Enhanced Image');

subplot(2,2,3);
bar(0:255,h);
xlim([0 255]);
title('Histogram Before');
xlabel('Intensity');
ylabel('Frequency');

subplot(2,2,4);
bar(0:255,h2);
xlim([0 255]);
title('Histogram After');
xlabel('Intensity');
ylabel('Frequency');

imwrite(J,'equalized_image.png');
