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

figure;
subplot(121);
colormap(gray(256));
imagesc(A);
axis equal;
axis tight;
title('INPUT IMAGE')

subplot(122);
colormap(gray(256));
imagesc(temp(2:h+1, 2:w+1));
axis equal;
axis tight;
title('EROSION IMAGE')

end