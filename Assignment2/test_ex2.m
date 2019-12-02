close all;
clear variables;
clear global;

filename = 'characters.tif';
input = imread( filename );

% input
figure;
colormap(gray(256));
image(input);
axis equal;
axis tight;
title(['"' filename '"']);
