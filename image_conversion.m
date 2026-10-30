
% Display all images without imshow

figure('Name', 'Image Conversions');

subplot(2,2,1);
imagesc(RGB);
axis image off;
title('Colour Image');

subplot(2,2,2);
imagesc(G);
colormap(gca, gray(256));
axis image off;
title('Grayscale Image');

subplot(2,2,3);
imagesc(BW1);
colormap(gca, gray(256));
axis image off;
title('Binary Image (T = 0.5)');

subplot(2,2,4);
imagesc(BW2);
colormap(gca, gray(256));
axis image off;
title('Binary Image (Otsu)');

% Save output images
imwrite(G, 'peppers_gray.png');
imwrite(BW2, 'peppers_binary.png');

disp('Images displayed and saved successfully.');
