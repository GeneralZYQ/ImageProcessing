function res = IPerode(image, structuringElement)

A = imread(image);

[h w] = size(A);
padded = padarray(A, [1 1]);
temp = zeros(h+1,w+1);

for i = 2:h+1
    for j = 2:w+1
        TArea = padded(i-1:i+1, j-1:j+1);
        overlap = all(all(structuringElement&TArea));
        temp(i,j) = overlap;
    end
end

res = temp(2:h+1, 2:w+1);

end