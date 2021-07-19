function [cost] = compute_cost_pc(points, centroids)
dim = zeros(rows(points));
cost = 0;
for i = [1 : rows(points)]
 x = Inf; 
 % ca sa aflu distanta minima
 %iinitializez x cu infinit
 for j = [1 : rows(centroids)]
  if (x > norm(points(i, :) - centroids(j, :)))
   x = norm(points(i, :) - centroids(j, :));
  endif;
 endfor;
 cost+=x;
endfor;
endfunction

