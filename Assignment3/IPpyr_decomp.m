function g = IPpyr_decomp(f,J,sigma)

I2 = im2double(f);
fprevious = I2;

gaussianMask = zeros(0,0);
originalSize = size(f);
M = originalSize(1);
P = 1;
rightFactor = 0;
for i = 0:(J-1)
    rightFactor = power(0.5, i) + rightFactor;
end
P = round( M * rightFactor);

midG = zeros(P,M);

series = {fprevious};
diffs = {};

gStartOffset = 1;

for i = 1:J
    fpreviousnext = IPdownsample(imgaussfilt(fprevious, sigma), 2);
    series{i+1} = fpreviousnext;
    residual =  fprevious - imgaussfilt(IPzoom(fpreviousnext, 2), sigma);
    diffs{i} = residual;
    fprevious = fpreviousnext;
    
    if i < J 
        
        currentSize = size(residual);
        residualWidth = currentSize(1);
        midG(gStartOffset:gStartOffset+residualWidth-1, ((M-residualWidth)/2)+1 :((M+residualWidth)/2)) = residual;
        gStartOffset = gStartOffset + residualWidth;
       
    end
    
    if i == J
        fJSize = size(series{i});
        fJwidth = fJSize(1);
        midG(gStartOffset:gStartOffset+fJSize-1, ((M-fJwidth)/2) :((M+fJwidth)/2)-1) = series{i};
    end
    
    
end

g = midG;

end
