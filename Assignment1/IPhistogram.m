

function res = IPhistogram(imName) 

im = imread(imName);
originalSize = size(im);

rawHistogram = zeros(1,256, 'uint32');


for i= 1:originalSize(1)
    for j = 1:originalSize(2)
        va = im(i, j);
        count = rawHistogram(1, va + 1);
        count = count + 1.0;
        rawHistogram(1, va + 1) = count;
    end
end

bar( 1:256, rawHistogram );
res = rawHistogram;


end