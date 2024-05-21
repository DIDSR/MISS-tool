% Convert Fourier Descriptors (FDs) code to contour of mask
% Its the **partial inverse function** of bd2Fdesc.m

% inputs 
% Fdesc: FD code (FD complex numbers and the total number of contour pixels)
% SIZE: the size of output contour image

% output
% image of the contour
%

function o = Fdesc2bd(Fdesc,SIZE)

len = Fdesc(end,1);
if mod(len,2) % odd
    len = len-1;
end
rc = fix(len/2)+1;

Fdesc(end,:)=[];
code_len = length(Fdesc);

bg = rc-((code_len-1)/2);
ed = rc+((code_len-1)/2);

ii=Fdesc(:,1);jj=Fdesc(:,2);
cmplx=ii+1i*jj;

border_cmplx=zeros(1,len);
border_cmplx(bg:ed) = cmplx;

border_ifft =ifft(ifftshift(border_cmplx));

border_restored = zeros(SIZE);
xx=round(real(border_ifft));yy=round(imag(border_ifft));
try
    for i=1:len
        border_restored(xx(i),yy(i))=1;
    end
catch
    border_restored = zeros(SIZE); % if error, return empty img -> sum(img(:))==0
end
o= logical(border_restored);
end