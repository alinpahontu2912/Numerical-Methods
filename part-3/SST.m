function [x] = SST(A, b)
    n = length(b);
    x = zeros(n, 1);
    sum = 0;
    %rezolv un sistem superior triunghiular
    x(n) = b(n) / A(n, n);
    for i = [(n - 1): -1 : 1]
       sum = A(i, (i + 1) : n) * x((i + 1) : n, 1);
       x(i) = (b(i) - sum) / A(i, i);
    endfor;
endfunction
    