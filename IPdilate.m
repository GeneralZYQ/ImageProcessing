%This is the file used to implement erosion.

function res = IPdilate(image, structuringElement)

A = imread(image);

[h w] = size(A);
padded = padarray(A, [1 1]);
temp = zeros(h,w);


for i = 2:h+1
    for j = 2:w+1
        Aarea = padded(i-1:i+1, j-1:j+1);
        tempo = structuringElement&Aarea;
        temp(i-1,j-1) = logical(sum(sum(tempo)));
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
imagesc(temp);
axis equal;
axis tight;
title('EROSION IMAGE')

end