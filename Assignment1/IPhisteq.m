function imeq = IPhisteq(im,hist)
    output = zeros(256,1);
    probability = zeros(256,1);

    [h, w] = size(im);
    num_pixels = h * w;
    
    sum=0;

    no_bins=255;

    for i=1:256
       sum=sum + hist(i);
       probability(i)=sum / num_pixels;
       output(i)=round(probability(i) * no_bins);
    end

    imeq = zeros(h,w);
    
    for i=1:h
        for j=1:w
            imeq(i,j)=output(im(i,j)+1);
        end
    end
end
