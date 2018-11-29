function [Ix, Iy ] = canny(I,sigma)
%CANNY Summary of this function goes here
% Create a version of the image only with its edges

%Sigma, Attention a  suivre la regle des 3sigmas plus ou moins
sizeFilterCanny = floor(sigma*3)+1;
% Taille de filtre
[X,Y]=meshgrid(-sizeFilterCanny:sizeFilterCanny);% Taille du filtre


%On determine les composantes x et y de l'image, en convoluant I avec la
%derivee de la gaussienne en fonction de x ou y

Gx=(-1/(2*pi*(sigma^4)))*X.*exp(-(((X.^2)+(Y.^2))/(2*(sigma^2))));
Gy=(-1/(2*pi*(sigma^4)))*Y.*exp(-(((X.^2)+(Y.^2))/(2*(sigma^2))));

% Gx = -X .* (exp(-(X .^ 2 + Y .^ 2) / (2 * sigma^ 2)) / (2 * pi * sigma^ 4));
% Gy = -Y .* (exp(-(X .^ 2 + Y .^ 2) / (2 * sigma^ 2)) / (2 * pi * sigma^ 4));

Ix=convn(I,Gx,'same'); %C'est le gradient de X 
Iy=convn(I,Gy,'same'); % C'est le gradient de Y 
%Ca permet de faire ressortir les endroits ou les contours sont forts aka
%les contours

%G=(Ix.*Ix+Iy.*Iy).^0.5; %Composante normalisee = norme du gradient

end