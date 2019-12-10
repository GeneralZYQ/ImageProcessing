%This is the implementation of function IPdownsample

%{
function res = IPdownsample(toShrink, factor)

%shrink the original image with a facor
%picking pixels every factor from the original one.
shrunkImage = toShrink(factor:factor:end, factor:factor:end);
res = shrunkImage;



end
%}

function r = IPdownsample(x, factor)
         r = x(1:factor:end, 1:factor:end);
end