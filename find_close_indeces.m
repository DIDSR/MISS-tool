% Get coordinates (x,y) of contour pixels
% Ordered by close indeces
% 

% inputs
% mask contour image (binary)

% output
% Coordinates (x,y) of contour pixels
%


function [new_indeces]=find_close_indeces(im_in)

[r,c]=find(im_in);

p=pdist([r c]);
psqr=squareform(p);

nl=length(r);

new_indeces=[r(1) c(1)];
ind_ind_data=1;
lenindata=1;
newind=1;
for ind=2:nl

    mcur_dist=psqr(newind,:);
    [dist_min,dist_min_ind]=sort(mcur_dist);
    [dmin inddmin]=setdiff(dist_min_ind,ind_ind_data);
    dist_min_ind =  dist_min_ind(sort(inddmin));
    newind=dist_min_ind(1);
    new_indeces  =[new_indeces; [r(newind) c(newind)]];

    ind_ind_data=[ind_ind_data; newind];
    lenindata=length(ind_ind_data);

end