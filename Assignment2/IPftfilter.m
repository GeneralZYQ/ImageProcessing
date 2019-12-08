function y = IPftfilter(x, H)    
    % Compute the 2D fourier transform of the image
    fftim = fftshift(fft2(double(x)));
    
    % Multiply by the transfer function
    out_spec_centre = fftim .* H;
    
    % Uncentre the spectrum
    out_spec = ifftshift(out_spec_centre);
    
    % Inverse, get real component and cast to 8-bit 
    y = uint8(real(ifft2(out_spec)));
end