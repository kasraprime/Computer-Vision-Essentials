function res = myconvolution(A, k)
[r,c] = size(A);
[m,n] = size(k);
h = rot90(k, 2);
%h=k';
temp = zeros(r + m*2-2, c + n*2-2);
for x = m : m+r-1
    for y = n : n+c-1
        temp(x,y) = A(x-m+1, y-n+1);
    end
end
res = zeros(r+m-1,n+c-1);
for x = 1 : r+m-1
    for y = 1 : n+c-1
        for i = 1 : m
            for j = 1 : n
                res(x, y) = res(x, y) + (temp(x+i-1, y+j-1) * h(i, j));
            end
        end
    end
end
