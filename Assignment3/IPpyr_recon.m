

function g2 = IPpyr_recon(g,J,sigma)

width = size(g, 2);
f = zeros(width, width);
startRow = 0
for i=0:(J-2)
    startRow = startRow + width*power(0.5, i);
end

fJ = g(startRow + 1:end,  ((width-width * power(0.5, J-1))/2):((width+width * power(0.5, J-1))/2)-1);%smallest image

for j = (J-1):-1:1
    
   residual = g((startRow - size(fJ,2) * 2)+1:startRow,((width-(size(fJ,2) * 2))/2)+1:((width+(size(fJ,2) * 2))/2));
   startRow = (startRow - size(fJ,2) * 2);
   fJ = imgaussfilt(IPzoom(fJ, 2), sigma) + residual;
end

g2 = fJ;

end