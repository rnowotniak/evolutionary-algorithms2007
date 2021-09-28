% locus2 - locus of second variable
function [ x, y ] = phenotype(s, xmin, xmax, ymin, ymax, coding, locus2)
if strcmp(coding, 'gray')
    s = gray2bin(s, locus2);
end
x = xmin + bin2dec(s(:,1:(locus2-1))) * ((xmax - xmin) / 2^(locus2-1));
y = ymin + bin2dec(s(:,locus2:length(s(1,:))) ) * ((ymax - ymin) / 2^(length(s(1,:))-locus2+1));
