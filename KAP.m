% Compute the Cohen Kappa (KAP) of two masks
%
% inputs 
% TP: True positive (pixels) of two masks
% FP: False positive (pixels) of two masks
% TN: True negative (pixels) of two masks
% FN: False negative (pixels) of two masks
%
% output 
% Cohen Kappa (KAP)

function kap = KAP(TP, FP, TN, FN)
N = TP + FP + TN + FN; % the total number
% Cohen Kappa
f_a = TP+TN;
f_c = ((TN+FN)*(TN+FP)+(FP+TP)*(FN+TP))/N;
kap = (f_a - f_c)/(N - f_c);

end