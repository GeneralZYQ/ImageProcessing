img = imread('blurrymoon.tif');
hist = IPhistogram(img);

imgeq = IPhisteq(img, hist);

figure;
show(imgeq);