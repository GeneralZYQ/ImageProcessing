close all;
clear variables;
clear global;

filename = 'circuitboard.tif';
input = imread( filename );

% input
figure;
colormap(gray(256));
image(input);
axis equal;
axis tight;
title(['"' filename '"']);

% noise input
P = 0.2;
input_saltpepper = imnoise(input,'salt & pepper',P);

figure;
colormap(gray(256));
image(input_saltpepper);
axis equal;
axis tight;
title(['salt-and-pepper noise "' filename '"']);

% median filtered noise image
input_median = medfilt2(input_saltpepper,[3 3]);

figure;
colormap(gray(256));
image(input_median);
axis equal;
axis tight;
title(['median filtered noise "' filename '"']);