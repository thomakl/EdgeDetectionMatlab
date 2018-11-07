close all
clear all


v2= VideoReader('template.mp4');
im=read(v2,1);
im=double(im);

% Convert the colored image to grayscale image 
grayI = grayScale(im);
% Apply a Gaussian Filter
%grayI = gaussianFilter(grayI,5,10);

% Create a version of the image only with its edges
[G, Ix,Iy] = canny(grayI,0.7);

imshow(G, [0 max(max(G))])
colormap(flipud(gray(256)))

[x,y]=cornerPage(G);


D = harris(G,0.04, Ix, Iy,5);
%D=max(D,0);
imshow(D, [5e+5 5e+8]);
colormap(flipud(gray(256)));

