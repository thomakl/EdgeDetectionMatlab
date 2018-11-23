v2= VideoReader('myVideo.mp4');


I = read(v2,1);
imshow(I)
[Xo,Yo] = ginput(1);
size = 100;


[ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner(I,Xo,Yo,size)

imshow(I)
hold on
scatter(xMaxHarris,yMaxHarris)


