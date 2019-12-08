%This is the implementation of function IPdownsample

function res = IPdownsample(imName, factor)

toShrink = imread(imName);

%shrink the original image with a facor
%picking pixels every factor from the original one.
shrunkImage = toShrink(factor:factor:end, factor:factor:end);
imwrite(shrunkImage, 'shrunk.tif');

res = shrunkImage;

end