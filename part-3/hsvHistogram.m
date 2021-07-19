function [sol] = hsvHistogram(path_to_image, count_bins)
A = imread(path_to_image);
[l1, l2, l3] = size(A);
sol = [];
H = zeros(1, count_bins);
S = zeros(1, count_bins);
V = zeros(1, count_bins);
r = A(:,:,1);
g = A(:,:,2);
b = A(:,:,3);
h = zeros(size(r));
s = zeros(size(r));
v = zeros(size(r));
%fac transformarea rgb -> hsv 
[h s v] = rgb2hsv(r,g,b);
	for k = [1: count_bins]
		ind1 = find(h < double(k - 1) * 1.01/count_bins);
		ind2 = find(h < double(k) * 1.01/count_bins ) ;
		if (k == 1)
			H(1, k) =length(ind1);
		endif;
		H(1,k) = length(ind2)-length(ind1);
		
		ind1 = find(s < double(k - 1) * 1.01/count_bins);
		ind2 = find(s < double(k) * 1.01/count_bins ) ;
		if (k == 1)
			S(1, k) =length(ind1);
		endif;
		S(1,k) = length(ind2)-length(ind1);
		
		ind1 = find(v < double(k - 1) * 1.01/count_bins);
		ind2 = find(v < double(k) * 1.01/count_bins ) ;
		if (k == 1)
			V(1, k) =length(ind1);
		endif;
		V(1,k) = length(ind2)-length(ind1);
	endfor;
%construiesc vectorul solutie
sol = [sol, H];
sol = [sol, S];
sol = [sol, V];
end