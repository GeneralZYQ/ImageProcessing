% This is used for Lab1 Exercise1

%IPdownsample('cktboard.tif', 4)
%IPupsample('cktboard.tif', 4)

IPfilter('bubbles.tif', [1.0/45.0 2.0/45.0 3.0/45.0;4.0/45.0 5.0/45.0 6.0/45.0;7.0/45.0 8.0/45.0 9.0/45.0])
 

function res = IPdownsample(imName, factor)

toShrink = imread(imName);

shrinkedImage = toShrink(factor:factor:end, factor:factor:end)
imwrite(shrinkedImage, 'shrinked.tif')

res = 0

end


function res = IPzoom(imName, factor)

toZoom = imread(imName);

zoomedImage = repelem(toZoom, factor, factor);

imwrite(zoomedImage, 'zoomed.tif')

res = 0

end

function res = IPupsample(imName, factor)

toUp = imread(imName);

zoomedImage = repelem(toUp, factor, factor);
disp(size(zoomedImage))

zoomedSize = size(zoomedImage);

for i=1:zoomedSize(1)
    for j=1:zoomedSize(2)
        
        if mod(i, factor) ~= 0 || mod(j, factor) ~= 0
            zoomedImage(i,j) = 0;
        end
        
    end
end

imwrite(zoomedImage, 'upped.tif')

res = 0
end

function res = IPfilter(imName, mask)

maskSize = size(mask);
if maskSize(1) ~= 3 || maskSize(2) ~=3
    error('úse a 3 * 3 mask please!')
    res = 0
end

originalImage = imread(imName);

originalSize = size( originalImage);
leftPadding = zeros(originalSize(1), 1);
rightPadding = zeros(originalSize(1), 1);
topPadding = zeros(1,originalSize(2)+2);
bottomPadding = zeros(1,originalSize(2)+2);


paddedImage = cat(2, leftPadding, originalImage);
paddedImage = cat(2, paddedImage, rightPadding);
paddedImage = cat(1, topPadding, paddedImage);
paddedImage = cat(1, paddedImage, bottomPadding);


toFilter = imread(imName);



for i = 2: originalSize(1) + 1
    for j = 2:originalSize(2) + 1
        gFinal = 0;
        for a = 1:3
            for b = 1:3
                gFinal = gFinal + paddedImage(i + (a - 2), j + (b - 2)) * mask(a, b);
            end
        end
        toFilter(i-1, j-1) = gFinal;
    end
end
    
imwrite(toFilter, 'filtered.tif')
res= 0;

end
