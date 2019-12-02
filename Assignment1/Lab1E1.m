% This is used for Lab1 Exercise1

%IPdownsample('cktboard.tif', 4);
%IPupsample('cktboard.tif', 4);
%IPzoom('cktboard.tif', 4);

%IPfilter('bubbles.tif', [1.0/45.0 2.0/45.0 3.0/45.0;4.0/45.0 5.0/45.0 6.0/45.0;7.0/45.0 8.0/45.0 9.0/45.0])

%IPhistogram('blurrymoon.tif')
%IPhisteq('blurrymoon.tif');
IPlaplacian('bubbles.tif', 1, 1);