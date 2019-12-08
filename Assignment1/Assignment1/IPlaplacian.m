%This file is used to implement IPlaplacian

function res = IPlaplacian(imName, K, delta)


mask = zeros(3);

for i = -1:1
    for j = -1:1
        mask(i+2, j+2) = K * power(exp(1), -((power(i,2) + power(j, 2)) / (2 * power(delta,2)))); 
    end
end

disp(mask / sum(mask(:)));
FinalMask = mask / sum(mask(:));

res = IPfilter(imName, FinalMask);

end