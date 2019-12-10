clc;                                  % clear the command window
close all;                            % close open figure windows      
clear all;                            % remove items from workspace

imname='plant';

inputName = [imname,'.tif'];   
f = imread(inputName);
sigma = 1.0;
J = 3;

g = IPpyr_decomp(f, J, sigma);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot images

% Plot the input image

figure;
subplot(121);
colormap(gray(256));
imagesc(f);
axis equal;
axis tight;
title('INPUT IMAGE')

% Plot the output image
subplot(122);
colormap(gray(256));
imagesc(g);
axis equal;
axis tight;
title('OUTPUT IMAGE')

all_file = [imname,'_all','_J=',num2str(J),'_sigma=',num2str(sigma),'.png'];
saveas(gcf,all_file);

g_file = [imname,'_g','_J=',num2str(J),'_sigma=',num2str(sigma),'.mat'];
save(g_file, 'g');