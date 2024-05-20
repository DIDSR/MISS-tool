% Interclass Correlation (ICC) of two masks

% inputs 
% f and m: two images of masks
%
% output 
% Interclass Correlation (ICC)
%


function icc=ICC(f,m)
numberElements_f = size(f,1)*size(f,2);
numberElements_m = size(m,1)*size(m,2);

if max(f(:))==1 % [0,1]->[0,255]
    f = f*255;
end

if max(m(:))==1 % [0,1]->[0,255]
    m = m*255;
end

f = double(f);
m = double(m);

sum_f = sum(f(:))/max(f(:));
sum_m = sum(m(:))/max(m(:));

numberElements = min(numberElements_f, numberElements_m);
mean_f = sum_f/numberElements_f;
mean_m = sum_m/numberElements_m;

ssw = 0;
ssb = 0;
grandmean = (mean_f + mean_m)/2;

for i = 1:numberElements
    val_f = f(i);
    val_m = m(i);
    mi = (val_f + val_m)/2;
    ssw = ssw + (val_f - mi)^2;
    ssw = ssw + (val_m - mi)^2;
    ssb = ssb + (mi - grandmean)^2;
end
ssw = ssw/numberElements;
ssb = ssb/(numberElements-1) * 2;
icc = (ssb - ssw)/(ssb + ssw);
end