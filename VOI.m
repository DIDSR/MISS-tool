% Compute the Variation of Information (VOI) of two masks
%
% inputs 
% n: Total number of pixels in a mask (must be same to the two masks)
% TP: True positive (pixels) of two masks
% FP: False positive (pixels) of two masks
% TN: True negative (pixels) of two masks
% FN: False negative (pixels) of two masks
%
% output 
% Variation of Information (VOI)

function voi=VOI(n,tp,fp,fn,tn)
row1 = tn + fn;
row2 = fp + tp;
H1 = - ( (row1/n)*log2(row1/n) + (row2/n)*log2(row2/n));

col1 = tn + fp;
col2 = fn + tp;
H2 = - ( (col1/n)*log2(col1/n) + (col2/n)*log2(col2/n));

if tn==0
    p00 = 1;
else
    p00 = tn/n;
end

if fn==0
    p01 = 1;
else
    p01 = fn/n;
end

if fp==0
    p10 = 1;
else
    p10 = fp/n;
end

if tp==0
    p11 = 1;
else
    p11 = tp/n;
end


H12= - ( (tn/n)*log2(p00) + (fn/n)*log2(p01) +  (fp/n)*log2(p10) + (tp/n)*log2(p11) );

mi=H1+H2-H12; % Mutual Information (MI)
voi=H1+H2-2*mi;

end