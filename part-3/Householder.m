function [Q, R] = Householder(A)
    [n,p] = size(A);
    %pentru matrici care nu sunt neaparat patratice
    Q = zeros(n,p);
    R = zeros(p,p);
    for k = 1:p
        Q(:,k) = A(:,k);
        if k ~= 1
            R(1:k-1,k) = transpose(Q(:,k-1))*Q(:,k);
            Q(:,k) = Q(:,k) - Q(:,1:k-1)*R(1:k-1,k);
        endif;
        R(k,k) = norm(Q(:,k));
        Q(:,k) = Q(:,k)/R(k,k);
     endfor;
endfunction
