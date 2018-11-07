function [grayI] = grayScale(I)
%GRAYSCALE Average all the colors to the grayscale
%   Detailed explanation goes here
%tempImage = double(imread(I));


% ------------------ PREMIER FILTARGE --------------------------------

%On "sépare" les différentes couches de couleurs de l'image sélectionnée
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

%On fait la moyenne des trois
grayI = (R+G+B)/3;
end

