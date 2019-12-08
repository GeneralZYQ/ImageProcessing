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

% filtered input
[M, N] = size(input);
H = IPbhpf(60, 2, M, N); 
filtered_input = IPftfilter(input, H);

figure;
colormap(gray(256));
image(filtered_input);
axis equal;
axis tight;
title(['BHPF filtered "' filename '"']);