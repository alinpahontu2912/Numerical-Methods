function [centroids] = clustering_pc(points, NC)
[n, m] = size (points);
B = zeros(1, m );
C = zeros(NC, m);
freq = zeros(1, NC);
c_g = zeros(1, m);
line = zeros(1, n);
%aflu primii centrozi facand media
%aritmetica a punctelor
	for k = [1 : NC]
		nr = 0;
		c_g = zeros(1, m);
		i = k;
		while ( i <= n)
			c_g(1,:) += points(i,:);
			nr++;
			i += NC;
		endwhile;
		c_g  /= nr;
		B = vertcat(B, c_g);
	endfor;
	B(1, :) = [];
	line = zeros(1, n);
	minim = zeros(1, NC);
	%cat timp inca se schimba centroizii
	while ( 1 )
		for i = [1 : n]
			x = Inf;
			for j = [1 : NC]
				if (x > norm(points(i, :) - B(j, :)))
					x = norm(points(i, :) - B(j, :));
					line(i) = j;
				endif;
			endfor;
		C(line(i), :) += points(i, :);
		freq(line(i))++;
		endfor;
		for l = [1 : NC]
			C(l, :) /= freq(l);
		endfor;
		if (C == B)
			break;
		endif;
		B = C;
		C = zeros(NC, m);
		freq = zeros(1, NC);
	endwhile;
centroids = C;
endfunction
