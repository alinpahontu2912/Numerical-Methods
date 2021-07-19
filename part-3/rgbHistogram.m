function [sol] = rgbHistogram(path_to_image, count_bins)
A = imread(path_to_image);
R = zeros(1, count_bins);
G = zeros(1, count_bins);
B = zeros(1, count_bins);
sol = [];
[n,m,p] = size(A);
	r = A(:,:,1);
	g = A(:,:,2);
	b = A(:,:,3);
	%caut cate elemente sunt in fiecare
	%interval cu functia length 
	for k = [1: count_bins]
		ind1 = find(r < double(k - 1) * 256/count_bins);
		ind2 = find(r < double(k) * 256/count_bins ) ;
		if (k == 1)
			R(1, k) +=length(ind1);
		endif;
		R(1,k) = length(ind2)-length(ind1);
		ind1 = find(g < double(k - 1) * 256/count_bins);
		ind2 = find(g < double(k) * 256/count_bins ) ;
		if (k == 1)
			G(1, k) +=length(ind1);
		endif;
		G(1,k) = length(ind2)-length(ind1);
		ind1 = find(b < double(k - 1) * 256/count_bins);
		ind2 = find(b < double(k) * 256/count_bins ) ;
		if (k == 1)
			B(1, k) +=length(ind1);
		endif;
		B(1,k) = length(ind2)-length(ind1);
	endfor;

sol = [sol, R];
sol = [sol, G];
sol = [sol, B];
end