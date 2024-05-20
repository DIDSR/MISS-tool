% Compute the Adjusted Rand Index (ARI) of two masks
%
% inputs 
% TP: True positive (pixels) of two masks
% FP: False positive (pixels) of two masks
% TN: True negative (pixels) of two masks
% FN: False negative (pixels) of two masks
%
% output 
% Adjusted Rand Index (ARI)

function out = ARI(TP, FP, TN, FN)
N = TP + FP + TN + FN;
a = 0.5*(TP*(TP - 1) + FP*(FP - 1) +TN*(TN - 1) + FN*(FN - 1));
b = 0.5*((TP + FN)^2 + (TN + FP)^2 -(TP^2 + TN^2 + FP^2 + FN^2));
c = 0.5*((TP + FP)^2 + (TN + FN)^2 -(TP^2 + TN^2 + FP^2 + FN^2));
d = N*(N - 1)/2 - (a + b + c);

out = (2*(a*d - b*c))/(c^2 + b^2 + 2*a*d + (a + d)*(c + b));

end
