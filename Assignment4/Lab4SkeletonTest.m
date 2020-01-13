%This file is used to test skeleton image
I = imread('nutsbolts.tif');

figure;
%subplot(121);
%colormap(gray(256));
%imagesc(I);
%axis equal;
%axis tight;
%title('INPUT IMAGE');

skeleton = IPskeletondecomp(I);

figure;
subplot(121);
colormap(gray(256));
imagesc(skeleton);
axis equal;
axis tight;
title('SKELETON IMAGE');

%I_recon = IPskeletonrecon(skeleton);

%figure;
%subplot(121);
%colormap(gray(256));
%imagesc(I_recon);
%axis equal;
%axis tight;
%title('RECONSTRUCTED IMAGE');
