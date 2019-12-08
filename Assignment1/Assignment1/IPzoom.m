%This is the implementation of IPZoom


function res = IPzoom(imName, factor)

toZoom = imread(imName);

zoomedImage = repelem(toZoom, factor, factor);

imwrite(zoomedImage, 'zoomed.tif');

res = toZoom;

end


