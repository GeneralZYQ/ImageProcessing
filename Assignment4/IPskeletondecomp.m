%This is the file used to decompose the image skeleton.

function [skel_img, skel_sets] = IPskeletondecomp(A)
    [h w] = size(A);
    B = [1 1 1; 1 1 1; 1 1 1];
    
    erosions = zeros(h,w);
    skel_sets = zeros(h,w);
    
    k = 1;
    erosions(:,:,k) = A;
    skel_sets(:,:,k) = erosions(:,:,k) - imopen(erosions(:,:,k),B);
    
    while sum(any(erosions(:,:,k)))>0
        k = k + 1;
        
        erosions(:,:,k) = imerode(erosions(:,:,k-1), B);
        skel_sets(:,:,k) = erosions(:,:,k) - imopen(erosions(:,:,k), B);
    end
    
    skel_img = skel_sets(:,:,1);
    
    for i = 2:k
        skel_img = skel_img | skel_sets(:,:,i);
    end
end