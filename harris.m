function [ D ] = harris(k, Ix, Iy,sigma )
% HARRIS : Apply the Harris Corner detection method to an image given its
% Gradient in X (Ix) and in Y (Iy) of Canny Edge Detector
% set empirical constant between 0.04-0.06 ; We set k = 0.05

% Corner Detection
Cxx = Ix.^2;
Cyy = Iy.^2; 
Cxy = Ix.*Iy; 
 
sizeFilter = floor(sigma*3)+1; % needs to be a integer

% Size of the filter
[X,Y]=meshgrid(-sizeFilter:sizeFilter);

% The Gaussian filter
gaussian = exp(-(X.^2+Y.^2)/(2*sigma^2))/(2*pi*(sigma^2));


% Convolution of the gaussian with the Gradient in X and Y
Cxx_=convn(Cxx,gaussian,'same');
Cyy_=convn(Cyy,gaussian,'same');
Cxy_=convn(Cxy,gaussian,'same');


% Harris matrix of the Image
D = Cxx_.*Cyy_ -(Cxy_.^2) - (k.*(Cxx_+Cxy_).^2);

end