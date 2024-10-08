% Hausdorff Distance: Compute the Hausdorff distance between two point clouds.
% Let A and B be subsets of a metric space (Z,dZ),
% The Hausdorff distance between A and B, denoted by dH (A, B), is defined by:
% dH (A, B)=max{sup dz(a,B), sup dz(b,A)}, for all a in A, b in B,
% dH(A, B) = max(h(A, B),h(B, A)),
% where h(A, B) = max(min(d(a, b))),
% and d(a, b) is a L2 norm.
% dist_H = hausdorff( A, B )
% A: First point sets.
% B: Second point sets.
% ** A and B may have different number of rows, but must have the same number of columns. **

% Author
% Hassan RADVAR-ESFAHLAN; Université du Québec; ÉTS; Montréal; CANADA 15.06.2010

% inputs
% Two images of masks
%
% output
% Average Hausdorff Distance (AVD)
%


function dh = hausdorff(img1, img2)

try

    [A(:,1),A(:,2)]=find(img1==1);
    [B(:,1),B(:,2)]=find(img2==1);

    if(size(A,2) ~= size(B,2))
        fprintf( 'WARNING: dimensionality must be the same\n' );
        dist = [];
        return;
    end
    dh = max(compute_dist(A, B), compute_dist(B, A));

catch ME % if error happen, return NaN
    disp (ME.message)
    dh = NaN;
end
end

% Compute distance
function [dist] = compute_dist(A, B)
m = size(A, 1);
n = size(B, 1);
dim= size(A, 2);
for k = 1:m
    C = ones(n, 1) * A(k, :);
    D = (C-B) .* (C-B);
    D = sqrt(D * ones(dim,1));
    dists(k) = min(D);
end
dist = max(dists);
end