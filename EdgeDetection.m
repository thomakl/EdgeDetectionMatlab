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

% Save the coordinates of each corner into the variable coordinatesCorner
% (manually)
coordinatesCorner = [x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4)];
predictPoints = ones(8);


% figure,


for n = [1:5]
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
%     imshow(D, [0 10]);
    
    % find the best corner for each 4 corners of the page
    if n == 1
        [ xA,yA ] = CornerAnalysis(D,x(1),y(1),40 );
        [ xB,yB ] = CornerAnalysis(D,x(2),y(2),40);
        [ xC,yC ] = CornerAnalysis(D,x(3),y(3),40);
        [ xD,yD ] = CornerAnalysis(D,x(4),y(4),40);
   
    else

        [ xA,yA ] = CornerAnalysis(D,coordinatesCorner(n,1),coordinatesCorner(n,2),40);
        [ xB,yB ] = CornerAnalysis(D,coordinatesCorner(n,3),coordinatesCorner(n,4),40);
        [ xC,yC ] = CornerAnalysis(D,coordinatesCorner(n,5),coordinatesCorner(n,6),40);
        [ xD,yD ] = CornerAnalysis(D,coordinatesCorner(n,7),coordinatesCorner(n,8),40);

    end
    


    
    % Save the new coordinates of each corner into the variable coordinatesCorner
    coordinatesCorner = [coordinatesCorner;xA,yA,xB,yB,xC,yC,xD,yD];
    
    % Predict the new coordinates of each corner into the variable coordinatesCorner   
    if n > 3
        predictPoints =  predictCorners(predictPoints,coordinatesCorner,n);
    end
    
    
    
%     hold on
%     scatter(x,y);
%     plot(x,y);
    
    
    
%     
   
    
%     F(n)=getframe(gcf);
%     drawnow

% predictPoints
end

% Display the variables
% coordinatesCorner
% predictPoints

%------------ Ecrire la video -----------------------
% WriteVideoOutput(F);


