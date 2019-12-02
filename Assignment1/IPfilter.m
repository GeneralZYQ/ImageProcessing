%This is the implementation of UPFilter

function res = IPfilter(imName, mask)

maskSize = size(mask);
if maskSize(1) ~= 3 || maskSize(2) ~=3
    error('úse a 3 * 3 mask please!')
    res = 0;
end

originalImage = imread(imName);

%Using the original size to generete paddings
originalSize = size( originalImage);
leftPadding = zeros(originalSize(1), 1);
rightPadding = zeros(originalSize(1), 1);
topPadding = zeros(1,originalSize(2)+2);
bottomPadding = zeros(1,originalSize(2)+2);

%Adding paddings 
paddedImage = cat(2, leftPadding, originalImage);
paddedImage = cat(2, paddedImage, rightPadding);
paddedImage = cat(1, topPadding, paddedImage);
paddedImage = cat(1, paddedImage, bottomPadding);


toFilter = imread(imName);

for i = 2: originalSize(1) + 1
    for j = 2:originalSize(2) + 1
        gFinal = 0;
        %adding the pixels neibors to the pixel with weights
        for a = 1:3
            for b = 1:3
                gFinal = gFinal + paddedImage(i + (a - 2), j + (b - 2)) * mask(a, b);
            end
        end
        toFilter(i-1, j-1) = gFinal;
    end
end
    
imwrite(toFilter, 'filtered.tif');%write to local
res= toFilter;

end
