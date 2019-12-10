%This is the implementation of IPZoom

%{
function res = IPzoom(toZoom, factor)

zoomedImage = repelem(toZoom, factor, factor);
res = zoomedImage;

end
%}

function r = IPzoom(x, factor)       

r = zeros(factor*size(x));       

for i=1:factor,           

    for j=1:factor,               

          r(i:factor:end, j:factor:end) = x;           

    end       

end


