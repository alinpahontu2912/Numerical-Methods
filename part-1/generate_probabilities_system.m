function [A, b] = generate_probabilities_system(rows)
	A = zeros(rows + 2);
	B = zeros (rows * (rows + 1)  / 2, 1 );
	x = [1: (rows * (rows + 1) ) / 2];
	k = 1;
	line = 1:(rows * (rows + 1)  / 2) :0;
	for i = [2 : rows + 1] 
		for j = [2 : i ]
			A(i,j) = x(k);
			k++;
			endfor;
	endfor;
	%construiesc matriccea A si o bordez cu 0
	%ca sa aflu probabilitatile parcurg jumatatea de jos
	%a matricii si numar cati vecini nenuli are un numar
		for k = [2 : rows + 1]
			for l = [ 2 : k]
				y = 0;
				line = zeros(size(B,1) , 1);
			if ( A(k-1, l-1 ) != 0)	
				y++;
				line(A(k-1,l-1)) = -1;
			endif;
			if (A(k-1, l) != 0)	
				y++;
				line( A(k-1,l) ) = -1;
			endif;
			if (A(k, l-1) != 0)	
				y++;
				line ( A(k, l-1) ) = -1;
			endif;
			if (A(k,l+1) != 0)	
				y++;
				line( A(k, l+1) ) = -1;
			endif;
			if (A(k + 1, l) != 0)
				y++;
				line ( A(k+1,l) ) = -1;
			endif;
			if (A(k+1, l+1) != 0)
				y++;
				line ( A(k+1,l+1) ) = -1;
			endif;
			if ( k == l)
				y++;
			endif;
			if ( l == 2)
				y++;
			endif;
			if ( k == rows + 1)
				y++;
			endif;
			%concatenez orizontal rezultatul obtinut 
			%ca sa aflu matricea A
			line (A(k,l)) = y;
			B = horzcat(B, line);
			endfor;
			endfor;
			B(:,1) = [];
			b = zeros (rows * (rows + 1)  / 2, 1 );
			for  i = [2 : rows+1]
				b(A(rows +1, i)) = 1;
			endfor;
			A = B;
endfunction