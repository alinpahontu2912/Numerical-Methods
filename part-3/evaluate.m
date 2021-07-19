function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
X = [];
z = transpose(w);
set1 = strcat(path_to_testset, "cats/");
set2 = strcat(path_to_testset, "not_cats/");
set3 = set1;
set4 = set2;
imgcats = getImgNames(set1);
imgncats = getImgNames(set2);
a = size(imgcats,1);
b = size(imgncats,1);
a = size(imgcats,1);
b = size(imgncats,1);
X = zeros(1,count_bins * 3);
nr = 0;
y = 0;
%parcurg fiecare poza din cele 2 foldere
%si creez vectorul y si matricea X
	if (strcmp(histogram, "HSV") == 0)
		i = 1;
		while (i <= a )
				image_path = strcat(set1, imgcats(i, :));
				X = hsvHistogram(image_path, count_bins);
				A = [X, y];
				A = transpose(A);
				y = 1;
				if (z * A > 0)
					nr++;
				endif;
				i++;
		endwhile;
		i = a + 1;
		while  (i <= b + a)
				image_path = strcat(set2, imgncats(i - a,:));
				X = hsvHistogram(image_path, count_bins);
				A = [X, y];
				A = transpose(A);
				y = 1;
				if (z * A < 0)
					nr++;
				endif;
				i++;
		endwhile;
	else 
		i = 1;
		while (i <= a)
				image_path = strcat(set3, imgcats(i,:));
				X = rgbHistogram(image_path, count_bins);
				A = [X, y];
				A = transpose(A);
				y = 1;
				if (z * A > 0)
					nr++;
				endif;
		i++;
		endwhile;
		i = a + 1;
		while (i <= b + a)
				image_path = strcat(set4, imgncats(i - a,:));
				X = rgbHistogram(image_path, count_bins);
				A = [X, y];
				A = transpose(A);
				y = 1;
				if (z * A < 0)
					nr++;
				endif;
		i++;
		endwhile;
	endif;
	percentage = double(nr)/(a+b);
	disp(percentage);
endfunction