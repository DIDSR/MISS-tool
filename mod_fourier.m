% input
%       img:
%       detail: < total pixels
%       range: <= detail
%       magnitude: >=0
%       GUI_use: true: image -> boundary
%                false: image -> image

function out = mod_fourier(img, detail, range, magnitude, GUI_use)

%
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
    out = mask;

else
    codes = bd2Fdesc(mask,detail);

    Fcode = codes(1:end-1,:);
    Len = size(Fcode,1);

    n= range;
    k= magnitude;

    for i=1:n
        rnd1 = (rand-0.5)*k;
        rnd2 = (rand-0.5)*k;
        Fcode(i,1)=Fcode(i,1)*(1+rnd1);
        Fcode(i,2)=Fcode(i,2)*(1+rnd2);
    end

    for j=Len:-1:(Len-n+1)
        rnd1 = (rand-0.5)*k;
        rnd2 = (rand-0.5)*k;
        Fcode(j,1)=Fcode(j,1)*(1+rnd1);
        Fcode(j,2)=Fcode(j,2)*(1+rnd2);
    end

    Fcode = [Fcode; codes(end,:)];

    try
        re_img = Fdesc2bd(Fcode,size(mask));
        se = strel('disk',2);
        CH = imdilate(re_img,se);
        CH = imfill(CH,'holes');
        [B, ~]  = bwboundaries(CH);
        bd = B{1}; % the first boundary

        if GUI_use % output boundary
            out=bd;
        else
            % output mask
            out = poly2mask(bd(:,2), bd(:,1),size(mask,1),size(mask,2));
        end

    catch
        disp ("Unexpected error or the output image may have more than one area! Try different parameters.")
        figure;imagesc(re_img);
    end

end

end