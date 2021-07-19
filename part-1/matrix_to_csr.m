function [values, colind, rowptr] = matrix_to_csr(A)
rowptr = [];
values = [];
colind = [];
nr = 0;
for i = [1: (size(A,1))]
 ok = 1;
for  j = [1: (size(A,1))]
 if (A(i,j) != 0 ) 
  nr ++;
 if ( ok )
  rowptr = [rowptr , nr ];
  ok = 0;
  endif;
  endif;
endfor;
for ( j = 1 : (size(A,1)))
 if ( A(i,j) != 0)
  values = [values , A(i,j) ];	
  colind = [colind , j ];
 endif;
endfor;
endfor;
rowptr = [rowptr , nnz(A) + 1 ];
endfunction