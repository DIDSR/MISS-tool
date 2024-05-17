% Author: Shuyue Guan (https://github.com/ShuyueG) @ FDA/DIDSR
% Date: July, 2022

% Reference
% Kim H, Monroe JI, Lo S, Yao M, Harari PM, Machtay M, Sohn JW.
% Quantitative evaluation of image segmentation incorporating medical
% consideration functions. Med Phys. 2015 Jun;42(6):3013-23. doi:
% 10.1118/1.4921067. PMID: 26127054.

% Compute the medical similarity index (MSI) of two segmentation
% structures: "reference" and "test" structures. **It depends on the BLD_idx
% function to find BLD pairing points in the reference structure.**

% Required function: BLD_idx.m

% 
% inputs 
% Images of Reference and Test structures inside level (il) and outside
% level (ol); their default values are 1
%
% output 
% The medical similarity index (MSI)
%



function MSI_value = MSI(ref_img,test_img,il,ol)

% default values of il and ol
if nargin < 3
il = 1;
ol = 1;
end

% Convert imgs to codes of boundaries
[b_ref,mask_ref] = img2boundary(ref_img);
[b_test,~] = img2boundary(test_img);

% Calculate the center of mass for reference and test contours
COM_ref = round(mean(b_ref));
COM_test = round(mean(b_test));

% Calculate the moving vector
mv_r = COM_ref(1) - COM_test(1);
mv_c = COM_ref(2) - COM_test(2);

% Move the test contour to align COM with the reference contour COM
new_b_test = zeros(size(b_test));
new_b_test(:,1) = b_test(:,1) + mv_r;
new_b_test(:,2) = b_test(:,2) + mv_c;

% Find BLD pairing points (indexes in Ref)
BLD_R_idx = BLD_idx(b_ref,new_b_test);

% Computer Local Distances
N = length(BLD_R_idx);
LDP = zeros(N,1);
%  Medical consideration function
MCF = zeros(N,1);

for i=1:length(BLD_R_idx)
    % Distance btw Test to paired point in Ref
    d = sqrt((b_ref(BLD_R_idx(i),1)-b_test(i,1))^2+(b_ref(BLD_R_idx(i),2)-b_test(i,2))^2);
    % inside Ref -> Negative; out Ref -> Positive
    if mask_ref(b_test(i,1),b_test(i,2))==0 % outside
        LDP(i)=d;
        MCF(i) = WF(d,ol);
    else % inside
        LDP(i)=-d;
        MCF(i) = WF(d,il);
    end
end

MSI_value = mean(MCF);
end

% Extract bounadry of image
function [b, mask] = img2boundary(img)
if size(img,3)~=1
    img=rgb2gray(img);
end

if ~isa(img,'logical')
    mask = imbinarize(img);  % binary area image
else
    mask = img;
end

[B, ~]  = bwboundaries(mask);

if length(B)>1
    disp ("The image has more than one area!")
    b=[];
    
else
    image_edged = double(bwperim(mask));
    [b]=find_close_indeces(image_edged);
    
end
end

% Gaussian weight function
function f = WF(x,l)
f = exp(-(l*x)^2/200);
end


