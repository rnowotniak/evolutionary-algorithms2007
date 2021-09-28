function [ x ] = phenotype(s, a, b, coding)
if strcmp(coding, 'gray')
    s = gray2bin(s);
end
x = a + bin2dec(s) * ((b - a) / 2^length(s(1,:)));
