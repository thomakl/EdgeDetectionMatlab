close all
clear all


v2= VideoReader('template.mp4');

image = read(v2,1);
imshow(image);
[x,y] = ginput(4);
hold on
scatter(x,y);
x(5) = x(1);
y(5)= y(1);
plot(x,y);

figure,


for n = [1:20]
    im=read(v2,n);
    im=double(im);

    % Convert the colored image to grayscale image 
    grayI = grayScale(im);
    
    % Apply a Gaussian Filter
    %grayI = gaussianFilter(grayI,5,10);
    % Create a version of the image only with its edges
    [G,Ix,Iy] = canny(grayI,2);

    %imshow(G, [0 400]);
    colormap(flipud(gray(256)));
        
    %[x,y]=cornerPage(G);

    D = harris(G,0.05, Ix, Iy,2).*abs(harris(G,0.05, Ix, Iy, 5));
    %D=max(D,0);
    %colormap(flipud(gray(256)));
    imshow(D, [0 10]);
        
    
    F(n)=getframe(gcf);
    drawnow
end

%------------ Ecrire la video -----------------------

% create the video writer with 1 fps
writerObj = VideoWriter('myVideo.mp4', 'MPEG-4');
writerObj.FrameRate = 2;
% set the seconds per image

% open the video writer
open(writerObj);

% write the frames to the video
for i=1:length(F)
    % convert the image to a frame
    frame = F(i) ;    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);


