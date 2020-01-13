%This is the file used to reconstruct the image based on the skeleton.

function A = IPskeletonrecon(skel_sets)
    [h w K] = size(skel_sets);
    B = [1 1 1; 1 1 1; 1 1 1];
    A = zeros(h,w);
    
    for k = 1:K
        dilate = skel_sets(:,:,k);
        
        for i = 1:k
            dilate = imdilate(dilate, B);
        end
        
        A = A | dilate;
    end
end