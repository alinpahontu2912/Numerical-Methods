function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
X = [];
set1 = strcat(path_to_dataset, "cats/");
set2 = strcat(path_to_dataset, "not_cats/");
set3 = set1;
set4 = set2;
imgcats = getImgNames(set1);
imgncats = getImgNames(set2);
a = size(imgcats,1);
b = size(imgncats,1);
X = zeros(a + b, count_bins * 3);
y = zeros(a + b,1);
%initializez x si y cu zero
	if (strcmp(histogram, "HSV") == 0)
		i = 1;
		while (i <= a )
				image_path = strcat(set1, imgcats(i, :));
				X(i, :) = hsvHistogram(image_path, count_bins);
				y(i, 1) = 1;
				i++;
		endwhile;
		i = a + 1;
		while  (i <= b + a)
				image_path = strcat(set2, imgncats(i - a,:));
				X(i, :) = hsvHistogram(image_path, count_bins);
				y(i, 1) = -1;
				i++;
		endwhile;
	else 
		i = 1;
		while (i <= a)
				image_path = strcat(set3, imgcats(i,:));
				X(i, :) = rgbHistogram(image_path, count_bins);
				y(i, 1) = 1;
		i++;
		endwhile;
		i = a + 1;
		while (i <= b + a)
				image_path = strcat(set4, imgncats(i - a,:));
				X(i, :) = rgbHistogram(image_path, count_bins);
				y(i, 1) = -1;
		i++;
		endwhile;
	endif;
	%lipesc coloana y lui X
	X = [X y];
endfunction
