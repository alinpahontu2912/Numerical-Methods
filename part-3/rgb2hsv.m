function [H,S,V] = rgb2hsv(R,G,B)
%fac conversia rgb -> hsv
R = double(R)/255;
G = double(G)/255;
B = double(B)/255;
M = max(R,max(G,B));
m = min(R,min(G,B));
D = M - m;
H = zeros(size(R));
S = zeros(size(G));
V = zeros(size(B));
H(M == R & D ~= 0) = 60 * mod((G(M == R & D ~= 0)-B(M == R & D ~= 0))./D(M == R & D ~= 0),6);
H(M == G & D ~= 0) = 60 * ((B(M == G & D ~= 0)-R(M == G & D ~= 0))./D(M == G & D ~= 0) + 2);
H(M == B & D ~= 0) = 60 * ((R(M == B & D ~= 0)-G(M == B & D ~= 0))./D(M == B & D ~= 0) + 4);
H =double(H)./360;
if (M ~= 0)
	S = D./M;
endif;
			
V = M;
endfunction