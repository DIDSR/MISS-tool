% Probabilistic Distance (PBD) of two masks

% inputs 
% f and m: two images of masks
%
% output 
% Probabilistic Distance (PBD)
%


function pd=PBD(f,m)
numberElements_f = size(f,1)*size(f,2);
numberElements_m = size(m,1)*size(m,2);

numberElements = min(numberElements_f, numberElements_m);

probability_joint = 0;
probability_diff = 0;

if max(f(:))==1 % [0,1]->[0,255]
    f = f*255;
end

if max(m(:))==1 % [0,1]->[0,255]
    m = m*255;
end

f = double(f);
m = double(m);

for i = 1:numberElements
    probability_diff = probability_diff + abs(f(i) - m(i));
    probability_joint = probability_joint + f(i) * m(i);
end

pd= -1;
if probability_joint ~= 0
    pd = probability_diff/(2*probability_joint);
end

end