%This is the recon test

clc;                                  % clear the command window
close all;                            % close open figure windows      
clear all;                            % remove items from workspace

imname='plant';

inputName = [imname,'.tif'];   
f = imread(inputName);
sigma = 1.0;
J = 3;

g = IPpyr_decomp(f, J, sigma);

g2 = IPpyr_recon(g, J, sigma);

figure;
subplot(121);
colormap(gray(256));
imagesc(f);
axis equal;
axis tight;
title('INPUT IMAGE')

subplot(122);
colormap(gray(256));
imagesc(g2);
axis equal;
axis tight;
title('RECONSTRUCTION IMAGE')

dv = 0
doublef = im2double(f);
for i = 1:size(f,2)
    for j = 1:size(f,1)
        dv = dv + abs(g2(j,i) - doublef(j,i));
    end
end

error = dv / (size(f,2) * size(f,1));

