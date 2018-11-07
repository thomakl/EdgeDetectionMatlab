function [ G, Ix, Iy ] = canny(I,sigma)
%CANNY Summary of this function goes here
% Create a version of the image only with its edges

%Sigma, Attention à suivre la regle des 3sigmas plus ou moins
sizeFilter = sigma*3+1;
% Taille de filtre
[X,Y]=meshgrid(-sizeFilter:sizeFilter);% Taille du filtre


%On détermine les composantes x et y de l'image, en convoluant I avec la
%dérivée de la gaussienne en fonction de x ou y
Gx=-(X/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gy=-(Y/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));

Ix=convn(I,Gx,'same'); %C'est le gradient de X 
Iy=convn(I,Gy,'same'); % C'est le gradient de Y 
%Ca permet de faire ressortir les endroits où les contours sont forts aka
%les contours

G=(Ix.*Ix+Iy.*Iy).^0.5; %Composante normalisée = norme du gradient

end