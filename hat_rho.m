% used in Spiculation.mlapp to add spiculations (hat-like shapes)

% theta in [0 2pi]

function out_rho = hat_rho(rho,theta,center,h,w)

% Find idx of nearest theta value to the given center
[~,c_idx]=min(abs(theta-center));

% Create the hat shape using Gaussian function
x = 1:length(theta);
y = h*exp(-((x-c_idx)./w).^2);

% add a hat shape on the curve by changing rho
out_rho = rho+y';

end
