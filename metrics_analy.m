clc, clear

testData=[];

sup = 9;

parfor TP = 0:sup
    for FP = 0:sup
        for FN = 0:sup
            for TN = 0:sup
                Res = icc(TP,FP,FN,TN);
                testData=[testData;[Res TP FP FN TN]];
            end
        end
    end
end

%%
results = testData(:,1);
plot(results)
disp (max(results))
disp (min(results))

% %%
% f = im2bw(imread('truth_mask.png'));
% m = im2bw(rgb2gray(imread('seg_mask.png')));
% 
% % [A(:,1),A(:,2)]=find(img1==1);
% % [B(:,1),B(:,2)]=find(img2==1);
% PBD(f,m)

function o=icc(TP,FP,FN,TN)
o=(4*TN*TP+(FP+FN)-(FP+FN)^2)/(4*TN*TP+2*(FP+FN)*(TP+TN)+(FP+FN)^2-(FP+FN));
end