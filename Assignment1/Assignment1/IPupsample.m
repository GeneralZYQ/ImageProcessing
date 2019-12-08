%This is the implementation of function IPupsample

function res = IPupsample(imName, factor)

toUp = imread(imName);

uppedImage = repelem(toUp, factor, factor);

zoomedSize = size(uppedImage);

for i=1:zoomedSize(1)
    for j=1:zoomedSize(2)
        
        if mod(i, factor) ~= 0 || mod(j, factor) ~= 0
            uppedImage(i,j) = 0;
        end
        
    end
end

imwrite(uppedImage, 'upped.tif');

res = uppedImage;
end