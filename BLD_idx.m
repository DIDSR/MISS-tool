% Author: Shuyue Guan (https://github.com/ShuyueG) @ FDA/DIDSR
% Date: July, 2022

% Reference
% The BLD was defined by Hak Soo Kim, Samuel B. Park, Simon S.
% Lo, James I. Monroe, Jason W. Sohn in their paper Bidirectional local
% distance measure for comparing segmentations,
% https://doi.org/10.1118/1.4754802, in Medical Physics.

% Finds the pairing points by fulfill the Bidirectional Local Distance
% (BLD) between two structures, a "reference" structure and a "test"
% structure. The result is the indexes of test's pairing points in the
% reference structure.
%
% inputs
% ref: Reference (N by dimensions) -- N is a number of points in
% Reference structure test: Test (M by dimensions) -- M is a number of
% points in Test structure
%
% output
% **BLD_R_idx: Mx1 vector, the indexes of Test's pairing points in the
% reference structure**
%
%

function BLD_R_idx = BLD_idx(ref, test)

[dtR, R_idx]= d_min(test, ref); % index in ref

[drT, T_idx]= d_min(ref, test); % index in test

% the length of idx of T's pairing points in Ref is # of points in test
BLD_R_idx = zeros(length(test),1);


for i=1:length(test)
    FMinD = dtR(i);
    FMinD_idx = R_idx(i); % index in ref

    BMaxD_idx = find(T_idx==i); % index in ref
    BMaxD = drT(T_idx==i);

    BLD_Candidate = [FMinD; BMaxD];
    BLD_idx_Candidate = [FMinD_idx; BMaxD_idx]; % index in ref

    [~, BLD_idx_Candidate_idx]= max(BLD_Candidate);

    % BLD_R_idx(i) is the max index in ref; i is the index in test
    BLD_R_idx(i) = BLD_idx_Candidate(BLD_idx_Candidate_idx);

end

end


function [d, d_idx] = d_min(T, R)

N_t = size(T, 1); % # of points in T

d = zeros(N_t,1);
d_idx = zeros(N_t,1);

for k = 1:N_t
    dist = sqrt(sum((R - T(k,:)).^2, 2));
    [d(k), d_idx(k)] = min(dist); % idx in R
end

end



