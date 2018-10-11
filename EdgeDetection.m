v = VideoReader('template.mp4')
video = double(read(v,150));

R = video(:,:,1);
G = video(:,:,2);
B = video(:,:,3);

A = (R+G+B)/3;

close all
% imshow(video)
% DETECTION CONTOUR
% deriver une image (ligne par ligne) avec possibilit� de discontinuite
% (car op�ration ind�pendement)
% filtrer l'image (Filtre passe-bas) 
% SOBEL : D�riv� x image filtr� passe-bas et m�me en y
% ==> image convolu� par la r�ponse impulsionnelle
% 
% A=double(imread('testB.tif'));
figure, imshow(uint8(A))
[X,Y]=meshgrid(-30:30);
sigma=5.7;
Hx=-(X/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Hy=-(Y/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gx=convn(A,Hx,'same');
Gy=convn(A,Hy,'same');
G=(Gx.*Gx+Gy.*Gy).^0.5;
figure, imshow(G, [0 160000000])
colormap(flipud(gray(256)))


