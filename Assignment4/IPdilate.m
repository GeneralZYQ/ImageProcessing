%This is the file used to implement erosion.

function res = IPdilate(image, structuringElement)

A = imread(image);
SEHat = flip(structuringElement,1)
SEHat = flip(SEHat,2)

[h w] = size(A);
padded = padarray(A, [1 1]);
temp = zeros(h+1,w+1);

for i = 2:h+1
    for j = 2:w+1
        TArea = padded(i-1:i+1, j-1:j+1);
        overlap = logical(sum(sum(SEHat&TArea)));
        temp(i,j) = overlap;
    end
end

res = temp(2:h+1, 2:w+1);

end