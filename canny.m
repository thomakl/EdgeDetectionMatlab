function [G,Ix, Iy ] = canny(I,sigma)
%CANNY : Smoothing the image while finding the intensity gradient of the image
%   Ix : Gradient for X : Convolution the image with the Gaussian
%   Derivative
%   Iy : Gradient for Y : Convolution the image with the Gaussian
%   Derivative

% filter= [-3*sigma+1;3*simga+1]
sizeFilterCanny = floor(sigma*3)+1;
% Creating the Filter
[X,Y]=meshgrid(-sizeFilterCanny:sizeFilterCanny);

% Gaussian Derivative according to X 
Gx=(-1/(2*pi*(sigma^4)))*X.*exp(-(((X.^2)+(Y.^2))/(2*(sigma^2))));
% Gaussian Derivative according to Y
Gy=(-1/(2*pi*(sigma^4)))*Y.*exp(-(((X.^2)+(Y.^2))/(2*(sigma^2))));

% Other way to write the Gradients
% Gx = -X .* (exp(-(X .^ 2 + Y .^ 2) / (2 * sigma^ 2)) / (2 * pi * sigma^ 4));
% Gy = -Y .* (exp(-(X .^ 2 + Y .^ 2) / (2 * sigma^ 2)) / (2 * pi * sigma^ 4));

% We determine the X,Y component of the image by convoluing the image with
% the Gaussian Derivative
% Gradient for X
Ix=convn(I,Gx,'same');
% Gradient for Y
Iy=convn(I,Gy,'same'); 
% ==> It alllows us to emphasize the edges (and the corners)

% Here's the Normalised Gradient (we don't need it here)
G=(Ix.*Ix+Iy.*Iy).^0.5; %Composante normalisee = norme du gradient

end