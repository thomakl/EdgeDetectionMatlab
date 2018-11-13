close all
clear all

v2= VideoReader('template.mp4');

for n = 1
    im=read(v2,n);
    imD=double(im);

    % Convert the colored image to grayscale image 
    grayI = grayScale(imD);
    
    % Apply a Gaussian Filter
    %grayI = gaussianFilter(grayI,5,10);
    % Create a version of the image only with its edges
    [G,Ix,Iy] = canny(grayI,2);

%     imshow(grayI, [0 400]);
%     colormap(flipud(gray(256)));
    

    [x,y]=cornerPage(grayI)

    D = harris(G,0.05, Ix, Iy,2).*abs(harris(G,0.05, Ix, Iy, 5));
%     D =max(D,0);
%     colormap(flipud(gray(256)));
%     imshow(D(500:1000,500:1000,:), [0 10]);
    
    
    [pX,pY] = CornerAnalysis(D,x(1),y(1),35)
    
%     cropH = D(500:1000,500:1000,:);
%     maxH = max(max(cropH))
%     [X Y]=ind2sub(size(cropH),maxH)
%     figure, 
%     imshow(grayI(800:1000,:1000,:), [0, 400])
%     hold on
%     plot(X,Y,'r*');     % Mark intersection with red asterisk  
%     scatter(round(X),round(Y),'r','filled')
%     
    

    
    

%     figure, imshow(imCropP1)
     
end


