function [ D ] = harris( I,k )
%HARRIS Summary of this function goes here
%   Detailed explanation goes here
% set empirical constant between 0.04-0.06
% Corner Detection
f = fspecial('gaussian');
Ix2 = convn(Ix.^2, f,'same'); %Cxx
Iy2 = convn(Iy.^2, f,'same'); %Cxy
Ixy = convn(Ix.*Iy, f,'same'); % Cyy


%C'est la matrice de Harris
D = Ix2*Iy2 -(Ixy^2) - (k*(Ix2+Iy2)^2);

end