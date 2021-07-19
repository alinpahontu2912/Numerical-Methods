function [w] = learn(X, y)
[Q, R] = Householder(X);
w = SST(R, transpose(Q) * y);
endfunction
