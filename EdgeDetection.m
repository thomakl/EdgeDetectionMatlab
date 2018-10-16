
v = VideoReader('template.mp4')
video = double(read(v,5));

R = video(:,:,1);
G = video(:,:,2);
B = video(:,:,3);

A = (R+G+B)/3;


% Gaussian Filter
sigmaGauss = 1;
sz = 1;    % length of gaussFilter vector
x = linspace(-sz / 2, sz / 2, sz);
gaussFilter = exp(-x .^ 2 / (2 * sigmaGauss ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter); % normalize

% y = rand(500,1);
% yfilt = filter (gaussFilter,1, y);

yfilt = convn(A, gaussFilter, 'same'); % apply the gaussian filter on the image

close all
% imshow(video)
% DETECTION CONTOUR
% deriver une image (ligne par ligne) avec possibilité de discontinuite
% (car opération indépendement)
% filtrer l'image (Filtre passe-bas) 
% SOBEL : Dérivé x image filtré passe-bas et même en y
% ==> image convolué par la réponse impulsionnelle
% 
% A=double(imread('testB.tif'));
figure,
subplot(2,2,1); imshow(uint8(A))
subplot(2,2,2); imshow(uint8(yfilt))

[X,Y]=meshgrid(-30:30);
sigma=5.0;
Hx=-(X/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Hy=-(Y/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gx=convn(yfilt,Hx,'same');
Gy=convn(yfilt,Hy,'same');
G=(Gx.*Gx+Gy.*Gy).^0.5;
subplot(2,2,3);
imshow(G, [0 max(max(G))])
colormap(flipud(gray(256)))


% Corner Detection 
figure, 
C = corner(G,'MinimumEigenvalue'); % corner(image, method)

imshow(G, [0 max(max(G))])
colormap(flipud(gray(256)))
hold on;
plot(C(:,1),C(:,2),'r*'); %add the corners found on the image


