% Mahanabolis Distance (MHD) of two masks

% inputs 
% Two images of masks
%
% output 
% Average Hausdorff Distance (AVD)
%

function mhd = MHD(img1, img2) 
[A(:,1),A(:,2)]=find(img1==1);
[B(:,1),B(:,2)]=find(img2==1);
n1 = size(A,1);
n2 = size(B,1);
u1 = mean(A);
u2 = mean(B);

S = (n1*cov(A)+n2*cov(B))/(n1+n2);
mhd = sqrt((u1-u2)*inv(S)*(u1-u2)');

end