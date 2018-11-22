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

close all

% Save the coordinates of each corner into the variable coordinatesCorner
% (manually)
coordinatesCorner = [x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4)];
predictPoints = ones(8);

for n = [1:50]
    im=read(v2,n);
    imD=double(im);

    % Convert the colored image to grayscale image 
    grayI = grayScale(imD);
    
    % Apply a Gaussian Filter
    %grayI = gaussianFilter(grayI,5,10);
    % Create a version of the image only with its edges
    [G,Ix,Iy] = canny(grayI,2);


    %imshow(G, [0 400]);
%     colormap(flipud(gray(256)));
        
    %[x,y]=cornerPage(G);

    D = harris(G,0.05, Ix, Iy,2).*abs(harris(G,0.05, Ix, Iy, 5));
    %D=max(D,0);
    colormap(flipud(gray(256)));
%     
    
    
    windowSize = 10;
    % find the best corner for each 4 corners of the page
    if n == 1
        [ xA,yA ] = CornerAnalysis(D,x(1),y(1),windowSize );
        [ xB,yB ] = CornerAnalysis(D,x(2),y(2),windowSize);
        [ xC,yC ] = CornerAnalysis(D,x(3),y(3),windowSize);
        [ xD,yD ] = CornerAnalysis(D,x(4),y(4),windowSize);
   
    else

        [ xA,yA ] = CornerAnalysis(D,coordinatesCorner(n-1,1),coordinatesCorner(n-1,2),windowSize);
        [ xB,yB ] = CornerAnalysis(D,coordinatesCorner(n-1,3),coordinatesCorner(n-1,4),windowSize);
        [ xC,yC ] = CornerAnalysis(D,coordinatesCorner(n-1,5),coordinatesCorner(n-1,6),windowSize);
        [ xD,yD ] = CornerAnalysis(D,coordinatesCorner(n-1,7),coordinatesCorner(n-1,8),windowSize);

    end
    
    imshow(D, [0 10]);
    hold on
    scatter(xA,yA)
    scatter(xB,yB)
    scatter(xC,yC)
    scatter(xD,yD)
    
    % Save the new coordinates of each corner into the variable coordinatesCorner
    coordinatesCorner = [coordinatesCorner;xA,yA,xB,yB,xC,yC,xD,yD];
    
    
%     % Predict the new coordinates of each corner into the variable coordinatesCorner   
%     if n > 3
%         predictPoints =  predictCorners(predictPoints,coordinatesCorner,n);
%     end
%     
    
    
    
    

%     F(n)=getframe(gcf);
%     drawnow

% predictPoints
end
save('pointsCordinates.mat','coordinatesCorner');

% Display the variables
% coordinatesCorner
% predictPoints

%------------ Ecrire la video -----------------------
% WriteVideoOutput(F);


