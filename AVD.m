% Average Hausdorff Distance (AVD): Compute the Average Hausdorff Distance between two point clouds.

% Authors
% Hassan RADVAR-ESFAHLAN; Université du Québec; ÉTS; Montréal; CANADA 15.06.2010
% Shuyue Guan (https://github.com/ShuyueG) @ FDA/DIDSR; USA; 03/2022

% inputs
% Two images of masks
%
% output
% Average Hausdorff Distance (AVD)
%

function avd = AVD(img1, img2)

try

    % d(a, b) is a L2 norm.
    % A: First point sets.
    % B: Second point sets.
    % ** A and B may have different number of rows, but must have the same number of columns. **
    [A(:,1),A(:,2)]=find(img1==1);
    [B(:,1),B(:,2)]=find(img2==1);

    if(size(A,2) ~= size(B,2))
        fprintf( 'WARNING: dimensionality must be the same\n' );
        dist = [];
        return;
    end

    % Option 1 ------
    % Mean of two dists
    avd = (compute_dist(A, B)+compute_dist(B, A))/2;
    %
    % Option 2 ------
    % Alternatively, max of two dist
    % avd = max(compute_dist(A, B), compute_dist(B, A));

catch ME % if error happen, return NaN
    disp (ME.message)
    avd = NaN;
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
dist = sum(dists(:))/m;

end