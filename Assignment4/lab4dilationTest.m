%This file is used to test dilation.
A = imread('wirebondmask.tif')
temp = IPdilate('wirebondmask.tif', [1 1 1; 1 1 1; 1 1 1])


figure;
subplot(121);
colormap(gray(256));
imagesc(A);
axis equal;
axis tight;
title('INPUT IMAGE')

subplot(122);
colormap(gray(256));
imagesc(temp);
axis equal;
axis tight;
title('DILATION IMAGE')
