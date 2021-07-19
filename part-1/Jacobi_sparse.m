function[x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
y = zeros(size(c));
x = csr_multiplication(G_values, G_colind, G_rowptr, y) + c;
%initializez y si x 
while (1)
 y = csr_multiplication(G_values, G_colind, G_rowptr, x) + c;
 x = csr_multiplication(G_values, G_colind, G_rowptr, y) + c;
 if (norm(x - y) <= tol) 
  break;
 endif;
endwhile;
endfunction