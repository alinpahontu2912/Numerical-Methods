function [G_J, c_J] = Jacobi_factorization(A, b)
L = (-1) * tril(A, -1);
U = (-1) * triu(A, 1);
D = diag(diag(A));
G_J = inv(D) * (L + U);
c_J = inv(D) * b;
endfunction