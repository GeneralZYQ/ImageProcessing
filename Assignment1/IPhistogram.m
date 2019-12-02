function hist = IPhistogram(im)  
    hist = zeros(1,256);
    
    [h, w] = size(im);
    
    for i=1:h
        for j=1:w
            hist(im(i,j)) = hist(im(i,j)) + 1;
        end
    end
end