function [grayI] = grayScale(I)
% GRAYSCALE Average all the colors in order to get a grayscale  


% Se split all the color {Red, Green, Blue}
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% We get the average of it
grayI = (R+G+B)/3;

end

