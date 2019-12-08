function H = IPbhpf(D0, n, M, N)    
    % Create rectangular grid with Euclidian distance from each cell to the center of the image.
    [V,U] = meshgrid(-floor(M/2):floor(M/2)-1,-floor(N/2):floor(N/2)-1);
    
    % Implementation of Butterworth highpass filter (BHPF) applied to the grid.
    D = sqrt(U.^2 + V.^2);
    H = 1 ./ (1 + (D0./D).^(2*n));
end