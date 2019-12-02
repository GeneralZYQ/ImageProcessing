function H = IPbhpf(D0, n, M, N)    
    % Create rectangular grid based on input.
    [V,U] = meshgrid(-floor(M/2):floor(M/2)-1,-floor(N/2):floor(N/2)-1);
    
    % Implementation of Butterworth highpass filter (BHPF).
    D = sqrt(U.^2 + V.^2);
    H = 1 ./ (1 + (D0./D).^(2*n));
end

%(20pt) Implement the Butterworth highpass filter (BHPF) transfer function H of size M × N with
% cutoff frequency D0 and order n, see Eq. (4-121), in a function H=IPbhpf(D0,n,M,N).