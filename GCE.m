% Compute the Global Consistency Error (GCE) of two masks
%
% inputs 
% TP: True positive (pixels) of two masks
% FP: False positive (pixels) of two masks
% TN: True negative (pixels) of two masks
% FN: False negative (pixels) of two masks
%
% output 
% Global Consistency Error (GCE)

function gce=GCE(tp,fp,fn,tn)
n = tn+fp+fn+tp;
e1 = ( fn*(fn+ 2*tp)/(tp+fn) + fp*(fp + 2*tn)/(tn+fp) )/n;
e2 = ( fp*(fp+2*tp)/(tp+fp) + fn*(fn + 2*tn)/(tn+fn) )/n;
gce=min(e1, e2);
end