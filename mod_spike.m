% input
%       img:
%       center: 0-360
%       height:
%       width:
%       GUI_use: true: boundary -> boundary
%                false: image -> image


function out = mod_spike(input, center, height, width, GUI_use)

if GUI_use

    bd_index = input;

else
    img = input;

    if size(img,3)~=1
        img=rgb2gray(img);
    end

    if ~isa(img,'logical')
        mask = imbinarize(img);  % binary area image
    else
        mask = img;
    end

    % extract binary boundary
    contour = bwperim(mask);
    % extract boundary indexes
    bd_index =find_close_indeces(contour);

end

x = bd_index(:,1);
y = bd_index(:,2);


% get cenrtoid
centerX = round(mean(x));
centerY = round(mean(y));
% convert to polar coordinate
[theta,rho] = cart2pol(x-centerX,y-centerY);
theta = theta + pi; % [-pi pi]->[0 2pi]
%-----------theta in [0 2pi]---- begin

location = (center/360)*(2*pi); % 360->2pi
out_rho = hat_rho(rho,theta,location,height,width);

%------------------------------- end
% convert back to Cartesian coordinate
[newx, newy] = pol2cart(theta-pi,out_rho); % [0 2pi]->[-pi pi]
Xint = round(newx) + centerX;
Yint = round(newy) + centerY;
bd = [Xint,Yint];

if GUI_use
    out = bd;
else
    % convert boundary to mask
    out = poly2mask(bd(:,2), bd(:,1),size(mask,1),size(mask,2));
    out = imfill(out,'holes');
end

end