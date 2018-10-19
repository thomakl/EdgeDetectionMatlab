close all
clear all



% Convert the colored image to grayscale image 
grayI = grayScale('testA.tif');
% Apply a Gaussian Filter
grayI = gaussianFilter(grayI,5,10);
% Create a version of the image only with its edges
G = canny(grayI,2);
imshow(G, [0 max(max(G))])
colormap(flipud(gray(256)))

%[x,y]=cornerPage(G);

