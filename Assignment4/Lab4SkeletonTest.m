%This file is used to test skeleton image
I = imread('nutsbolts.tif');

figure;
subplot(131);
colormap(gray(256));
imagesc(I);
axis equal;
axis tight;
title('INPUT IMAGE');

[skel_img, skel_sets] = IPskeletondecomp(I);

subplot(132);
colormap(gray(256));
imagesc(skel_img);
axis equal;
axis tight;
title('SKELETON IMAGE');

I_recon = IPskeletonrecon(skel_sets);

subplot(133);
colormap(gray(256));
imagesc(I_recon);
axis equal;
axis tight;
title('RECONSTRUCTED IMAGE');
