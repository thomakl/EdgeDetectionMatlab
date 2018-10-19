function [x,y] = cornerPage( I )
%CORNERPAGE Summary of this function goes here
% Extract the 4 corners of the page manually
figure, imshow(I, [0 max(max(I))]), colormap(flipud(gray(256)))
[x,y] = ginput(4);
hold on
scatter(x,y)
end