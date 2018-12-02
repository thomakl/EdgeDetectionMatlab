
close all
clear all

vidObj= VideoReader('template.mp4');

im=read(vidObj,1);

imD = double(im);

XY = [685 411 1339 234 628 768 1432 582];
% imshow(im), title('Original Image')
% hold on
%     scatter(XY(1),XY(2),50,'r', 'filled')
%     scatter(XY(3),XY(4),50,'r', 'filled')
%     scatter(XY(5),XY(6),50,'r', 'filled')
%     scatter(XY(7),XY(8),50,'r', 'filled')

%  % Convert the colored image to grayscale image 
grayI = grayScale(imD);
 
[G1,Ix,Iy] = canny(grayI,2);

D3 = harris(0.05, Ix, Iy,3);
D5 = harris(0.05, Ix, Iy,5);
D = harris(0.05, Ix, Iy,3).*abs(harris(0.05, Ix, Iy, 5));

figure, imshow(D, [0 20]);, title('Harris Detector : sigma = 3'), 
hold on
scatter(XY(1),XY(2),50,'r', 'filled')
rectangle('Position',[XY(1)-18 XY(2)-18 2*18 2*18],'EdgeColor','r')

% 
% figure,
% subplot(2,2,1), imshow(im), title('Original Image')
% subplot(2,2,2), imshow(D5, [0 20]);, title('Harris Detector combined : sigma1 = 3 and sigma2 = 5')
% subplot(2,2,3), imshow(D3, [0 20]);, title('Harris Detector : sigma = 5')
% subplot(2,2,4), imshow(D, [0 20]);, title('Harris Detector : sigma = 3')

