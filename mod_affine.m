% input
%       img:
%       resize: [rx, ry]
%       rotate: phi 0-360
%       shift: [sx, sy]
%       GUI_use: true: image -> boundary
%                false: image -> image

function out = mod_affine(img, resize, rotate, shift, GUI_use)

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
    disp ("The input image has more than one area!")
    if GUI_use
        out = B{1}; % take the first boundary
    else
        out = mask;
    end
    
% no change
elseif resize(1)==1 && resize(2)==1 && rotate==0 && shift(1)==0 && shift(2)==0
    if GUI_use
        out = B{1}; % take the first boundary
    else
        out = mask;
    end
        
else
    obd = B{1}; % take the first boundary
    bd = func_resize(mask,obd,resize);
    bd = func_rotate(mask, bd, rotate);
    bd = func_move(mask, bd, shift);
    
    if GUI_use
        out = bd;
    else
    % convert boundary to mask
    out = poly2mask(bd(:,2), bd(:,1),size(mask,1),size(mask,2));
    end
    
end

end


function out = func_resize(mask,boundary,resize)

rx = resize(1);
ry = resize(2);

[r ,c]=size(mask);
rs_mask = imresize(mask,[r*rx, c*ry]);
[B, ~]  = bwboundaries(rs_mask);

rs_bd = B{1};

% old cener
r0 = round(0.5*(max(boundary(:,1))+min(boundary(:,1))));
c0 = round(0.5*(max(boundary(:,2))+min(boundary(:,2))));

% new cener
r1 = round(0.5*(max(rs_bd(:,1))+min(rs_bd(:,1))));
c1 = round(0.5*(max(rs_bd(:,2))+min(rs_bd(:,2))));

new_bd = zeros(size(rs_bd));
% move back
tras = [1 0 r0-r1; 0 1 c0-c1; 0 0 1];

for i = 1:length(new_bd)
    p = [rs_bd(i,1); rs_bd(i,2); 1];
    p = tras*p;
    
    % make sure not exceed the image size
    x = p(1,1); y = p(2,1);
    if (x<=r) && (y<=c) && (x>=1) && (y>=1)
        new_bd(i,1)=x; new_bd(i,2)=y;
    end
end

out = new_bd;
end


function out = func_rotate(mask, boundary, rotate)

new_bd = zeros(size(boundary));
[r ,c]=size(mask);

% ceners of rotation
r0 = round(0.5*(max(boundary(:,1))+min(boundary(:,1))));
c0 = round(0.5*(max(boundary(:,2))+min(boundary(:,2))));

degree = rotate*pi / 180;

% rotation by center point ------------------------

% Shift X/Y to the rotation center
tras1 = [1 0 -r0; 0 1 -c0; 0 0 1];
% Rotate the coordinates
tras2 = [cos(degree) -sin(degree) 0; sin(degree) cos(degree) 0; 0 0 1];
% Shift the rotated coordinates back to the original reference center
tras3 = [1 0 r0; 0 1 c0; 0 0 1];

for i = 1:length(new_bd)
    p = [boundary(i,1); boundary(i,2); 1];
    p = tras3 * tras2 * tras1 * p;
    
    % make sure not exceed the image size
    x = p(1,1); y = p(2,1);
    if (x<=r) && (y<=c) && (x>=1) && (y>=1)
        new_bd(i,1)=x; new_bd(i,2)=y;
    end
end

out = new_bd;
end

function out = func_move(mask, boundary, shift)

sx = shift(1);
sy = shift(2);

new_bd = zeros(size(boundary));
[r ,c]=size(mask);

tras = [1 0 sx; 0 1 sy; 0 0 1];

for i = 1:length(new_bd)
    p = [boundary(i,1); boundary(i,2); 1];
    p = tras*p;
    
    % make sure not exceed the image size
    x = p(1,1); y = p(2,1);
    if (x<=r) && (y<=c) && (x>=1) && (y>=1)
        new_bd(i,1)=x; new_bd(i,2)=y;
    end
end

out = new_bd;
end
