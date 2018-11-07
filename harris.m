function [ D ] = harris( I,k, Ix, Iy,sigma )
%HARRIS Summary of this function goes here
%   Detailed explanation goes here
% set empirical constant between 0.04-0.06
% Corner Detection
%f = fspecial('gaussian');
Cxx = Ix.*Ix;
Cyy = Iy.*Iy; 
Cxy = Ix.*Iy; 

sizeFilter = sigma*3;

% Taille de filtre
[X,Y]=meshgrid(-sizeFilter:sizeFilter);% Taille du filtre

%Filtre convolutif. Il faut un morceau à convoluer qui est plus gros que le
%résultat qu'on veut obtenir.
gaussienne = (1/2*pi.*(sigma^2))*exp(-(((X .^ 2)+(Y.^2)) / (2 * sigma ^ 2)));

Cxx_=convn(Cxx,gaussienne,'same');
Cyy_=convn(Cyy,gaussienne,'same');
Cxy_=convn(Cxy,gaussienne,'same');


%C'est la matrice de Harris
D = Cxx_.*Cyy_ -(Cxy_.^2) - (k.*(Cxx_+Cxy_).^2);

end