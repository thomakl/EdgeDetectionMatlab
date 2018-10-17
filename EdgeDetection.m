
%On lit la video
v = VideoReader('template.mp4')
video = double(read(v,5));

% ------------------ PREMIER FILTARGE --------------------------------

%On "s�pare" les diff�rentes couches de couleurs de l'image s�lectionn�e
R = video(:,:,1);
G = video(:,:,2);
B = video(:,:,3);

%On fait la moyenne des trois
A = (R+G+B)/3;


% A=double(imread('testB.tif'));
figure,
subplot(2,2,1); imshow(uint8(A))
subplot(2,2,2); imshow(uint8(yfilt))

[X,Y]=meshgrid(-10:10);% Taille du filtre
sigma=2;%Sigma, Attention � suivre la r�gle des 3sigmas plus ou moins

%On d�termine les composantes x et y de l'image, en convoluant I avec la
%d�riv�e de la gaussienne en fonction de x ou y
Gx=-(X/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gy=-(Y/2*pi*(sigma)^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));

Ix=convn(A,Gx,'same'); %C'est le gradient de X 
Iy=convn(A,Gy,'same'); % C'est le gradient de Y 
%Ca permet de faire ressortir les endroits o� les contours sont forts aka
%les contours

G=(Ix.*Ix+Iy.*Iy).^0.5; %Composante normalis�e = norme du gradient
subplot(2,2,3);
imshow(G, [0 max(max(G))])
colormap(flipud(gray(256)))

%---------------- INITIALISATION DE 4 POINTS MANUELLEMENT ---------------

% Extract the 4 corners of the page manually
figure, imshow(G, [0 max(max(G))]), colormap(flipud(gray(256)))
[x,y] = ginput(4);
hold on
scatter(x,y)

%------------------------- APPROCHE DE HARRIS -------------------------


%  Cr�ation du Gaussian Filter
sigmaGauss = 1; %"Taux de floutage"
sz = 1;    % length of gaussFilter vector
x = linspace(-sz / 2, sz / 2, sz);
gaussFilter = exp(-x .^ 2 / (2 * sigmaGauss ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter); % normalize



%yfilt = convn(A, gaussFilter, 'same');  apply the gaussian filter on the image


% Corner Detection
f = fspecial('gaussian');
Ix2 = convn(Ix.^2, f,'same'); %Cxx
Iy2 = convn(Iy.^2, f,'same'); %Cxy
Ixy = convn(Ix.*Iy, f,'same'); % Cyy

% set empirical constant between 0.04-0.06
k = 0.06;

%C'est la matrice de Harris
D = Ix2*Iy2 -(Ixy^2) - (k*(Ix2+Iy2)^2);

imshow(D);

% store the R values in our Harris Matrix
%H(y,x) = R1;

%Prends les mesures de l'image
% num_rows = size(A,1);
% num_cols = size(A,2);

% create a matrix to hold the Harris values
% H = zeros(num_rows, num_cols);

% get our matrix M for each pixel

% calculate means (because mean is sum/num pixels)
% generally, this algorithm calls for just finding a sum,
% but using the mean makes visualization easier, in my code,
% and it doesn't change which points are computed to be corners.
% Ix2 mean
% Ix2_matrix = Ix2(y-2:y+2,x-2:x+2);
% Ix2_mean = sum(Ix2_matrix(:));
% 
% % Iy2 mean
% Iy2_matrix = Iy2(y-2:y+2,x-2:x+2);
% Iy2_mean = sum(Iy2_matrix(:));
% 
% % Ixy mean
% Ixy_matrix = Ixy(y-2:y+2,x-2:x+2);
% Ixy_mean = sum(Ixy_matrix(:));




       


% % Corner Detection 
% figure, 
% C = corner(G,'MinimumEigenvalue'); % corner(image, method)
% 
% imshow(G, [0 max(max(G))])
% colormap(flipud(gray(256)))
% hold on;
% plot(C(:,1),C(:,2),'r*'); %add the corners found on the image
% 
% 


