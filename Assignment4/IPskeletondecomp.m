%This is the file used to decompose the image skeleton.

function skeleton = IPskeletondecomp(A)
    [h w] = size(A);
    B = [1 1 1; 1 1 1; 1 1 1];
    
    erosions = zeros(h,w);
    S = zeros(h,w);
    
    k = 1;
    erosions(:,:,k) = A;
    S(:,:,k) = erosions(:,:,k) - imopen(erosions(:,:,k),B);
    
    while sum(any(erosions(:,:,k)))>0
        k = k + 1;
        
        erosions(:,:,k) = imerode(erosions(:,:,k-1), B);
        opening = imopen(erosions(:,:,k), B);
        S_temp = erosions(:,:,k) - opening;
        
        S(:,:,k) = S_temp;
    end
    
    skeleton = S(:,:,1);
    
    for i = 2:k
        skeleton = skeleton | S(:,:,i);
    end
end