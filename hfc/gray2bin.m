% where -- locus of second variable in chromosom
function [ b ] = gray2bin( g, where )
siz = size(g);
if length(siz) == 1
    b(1) = g(1);
    for n = 2:(where - 1)
        if g(n) == '0' && b(n - 1) == '1'
            b(n) = '1';
        elseif g(n) == '1' && b(n - 1) == '0'
            b(n) = '1';
        else
            b(n) = '0';
        end
    end
    b(where) = g(where);
    for n = where + 1:length(g)
        if g(n) == '0' && b(n - 1) == '1'
            b(n) = '1';
        elseif g(n) == '1' && b(n - 1) == '0'
            b(n) = '1';
        else
            b(n) = '0';
        end
    end
else
    for i = 1:siz(1)
        b(i,1) = g(i,1);
        for n = 2:(where - 1)
            if g(i,n) == '0' && b(i,n - 1) == '1'
                b(i,n) = '1';
            elseif g(i,n) == '1' && b(i,n - 1) == '0'
                b(i,n) = '1';
            else
                b(i,n) = '0';
            end
        end
        b(i,where) = g(i,where);
        for n = where + 1:siz(2)
            if g(i,n) == '0' && b(i,n - 1) == '1'
                b(i,n) = '1';
            elseif g(i,n) == '1' && b(i,n - 1) == '0'
                b(i,n) = '1';
            else
                b(i,n) = '0';
            end
        end
    end
end