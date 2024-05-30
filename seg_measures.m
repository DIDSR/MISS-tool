% This function is used for segmentation
% performance evaluation of user’s inputs (truth masks and segmentation results)

% input: Two binary images {0, 1}, same size
%        If compute Hausdorff Distances (slower): Boolean
% output: A struct data includes 24 indexes of segmentation evaluation metrics
% 1.    DICE      Dice Coefficient
% 2.    JAC        Jaccard Coefficient
% 3.    MSI       Medical Similarity Index
% 4.    FN          False Negative (Confusion matrix)
% 5.    FP          False Positive (Confusion matrix)
% 6.    TN         True Negative (Confusion matrix)
% 7.    TP          True Positive (Confusion matrix)
% 8.    TPR        Sensitivity (Recall, true positive rate)
% 9.    TNR       Specificity (true negative rate)
% 10.   FPR        Fallout (false positive rate)
% 11.   PPV       Precision (also called positive predictive value)
% 12.   ACC       Accuracy
% 13.   AUC       Area under ROC Curve (one system state)
% 14.   KAP       Cohen Kappa
% 15.   ARI        Adjusted Rand Index
% 16.   ICC        Interclass Correlation
% 17.   VS          Volumetric Similarity Coefficient
% 18.   MI         Mutual Information
% 19.   VOI        Variation of Information
% 20.   PBD       Probabilistic Distance
% 21.   GCE       Global Consistency Error
% 22.   HD         Hausdorff Distance (optionally in voxel or millimeter)
% 23.   AVD      Average Hausdorff Distance (optionally in voxel or millimeter)
% 24.   MHD     Mahanabolis Distance

function idx = seg_measures(omask,filled,compute_Hausdorff)
idx = struct;

idx.Dice = dice(omask,filled);
idx.Jaccard = jaccard(omask,filled);

% medical similarity index (MSI)
% by default = MSI(ref_img,test_img,1,1);
idx.MSI = MSI(omask,filled);

confusionMatrix = segmentationConfusionMatrix(filled,omask);
idx.FN = confusionMatrix(2,1); 
idx.FP = confusionMatrix(1,2);
idx.TN = confusionMatrix(1,1); 
idx.TP = confusionMatrix(2,2);
N = idx.TP + idx.FP + idx.TN + idx.FN; % the total number

idx.Recall_Sensitivity_TPR = idx.TP/(idx.TP+idx.FN);
idx.Specificity_TNR = idx.TN/(idx.TN+idx.FP);
idx.Fallout_FPR = idx.FP/(idx.FP+idx.TN);
idx.Precision_PPV = idx.TP/(idx.TP+idx.FP);
idx.Accuracy_ACC = (idx.TP+idx.TN)/N;

idx.AUC = 1-0.5*(idx.FP/(idx.FP+idx.TN)+idx.FN/(idx.FN+idx.TP));
idx.KAP = KAP(idx.TP, idx.FP, idx.TN, idx.FN); % Cohen Kappa
idx.ARI = ARI(idx.TP, idx.FP, idx.TN, idx.FN);
idx.ICC = ICC(omask,filled);
idx.VS = 1-abs(idx.FN-idx.FP)/(2*idx.TP + idx.FN + idx.FP);
idx.MI=MI(N,idx.TP,idx.FP,idx.FN,idx.TN);
idx.VOI=VOI(N,idx.TP,idx.FP,idx.FN,idx.TN);
idx.PBD=PBD(omask,filled);
idx.GCE=GCE(idx.TP,idx.FP,idx.FN,idx.TN);
% Compute Hausdorff Distances (slower)
if compute_Hausdorff==true
    idx.HD = hausdorff(omask,filled);
    idx.AVD = AVD(omask,filled);
else
    idx.HD = NaN;
    idx.AVD = NaN;
end

idx.MHD = MHD(omask,filled);

end