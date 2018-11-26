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
predictPoints = coordinatesCorner;
figure,
for n = [1:200]
    n
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
    %colormap(flipud(gray(256))); 
    
    
    windowSize = 25;
    % find the best corner for each 4 corners of the page
    if n == 1
        [ xA,yA ] = CornerAnalysis(D,x(1),y(1),windowSize );
        [ xB,yB ] = CornerAnalysis(D,x(2),y(2),windowSize);
        [ xC,yC ] = CornerAnalysis(D,x(3),y(3),windowSize);
        [ xD,yD ] = CornerAnalysis(D,x(4),y(4),windowSize);
    end

     if (n > 1) && (n <= 4)
        [ xA,yA ] = CornerAnalysis(D,coordinatesCorner(n-1,1),coordinatesCorner(n-1,2),windowSize);
        [ xB,yB ] = CornerAnalysis(D,coordinatesCorner(n-1,3),coordinatesCorner(n-1,4),windowSize);
        [ xC,yC ] = CornerAnalysis(D,coordinatesCorner(n-1,5),coordinatesCorner(n-1,6),windowSize);
        [ xD,yD ] = CornerAnalysis(D,coordinatesCorner(n-1,7),coordinatesCorner(n-1,8),windowSize);
        

    end
    
    
    
    % Save the new coordinates of each corner into the variable coordinatesCorner
    coordinatesCorner = [coordinatesCorner;xA,yA,xB,yB,xC,yC,xD,yD];
    
    
    % Predict the new coordinates of each corner into the variable coordinatesCorner   
    if n > 4
        predictPoints =  predictCorners(predictPoints,coordinatesCorner,n);
        [ xA,yA ] = CornerAnalysis(D,predictPoints(n-3,1),predictPoints(n-3,2),windowSize);
        [ xB,yB ] = CornerAnalysis(D,predictPoints(n-3,3),predictPoints(n-3,4),15);
        [ xC,yC ] = CornerAnalysis(D,predictPoints(n-3,5),predictPoints(n-3,6),windowSize);
        [ xD,yD ] = CornerAnalysis(D,predictPoints(n-3,7),predictPoints(n-3,8),windowSize);

        
    end   
    
    imshow(D, [0 20]); %, colormap(flipud(gray(256)));
    hold on
    scatter(xA,yA,100,'r', 'filled')
    scatter(xB,yB,100,'r', 'filled')
    scatter(xC,yC,100,'r', 'filled')
    scatter(xD,yD,100,'r', 'filled')
    
    

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


