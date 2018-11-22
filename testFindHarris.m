v2= VideoReader('myVideo.mp4');


I = read(v2,1);
imshow(I)
[Xo,Yo] = ginput(1);
size = 40;

imCropPXY = imcrop(I,[Xo-size Yo-size 2*size 2*size]);
[X,Y] = findMaxHarrisCorner(imCropPXY);

imshow(imCropPXY)
hold on
scatter(X,Y)


