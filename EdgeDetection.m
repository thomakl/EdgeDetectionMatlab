close all
clear all

% Import the video as vidObj
vidObj= VideoReader('template.mp4');
% Get the number of frame of the video
numFrames = ceil(vidObj.FrameRate*vidObj.Duration);


%image = read(v2,1);
%imshow(image);


% [x,y] = ginput(4);
% hold on
% scatter(x,y);
% x(5) = x(1);
% y(5)= y(1);
% plot(x,y);
% 
% close all
% 
% % Save the coordinates of each corner into the variable coordinatesCorner
% % (manually)
% coordinatesCorner = [x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4)];

% Here's the initial coordinates of the corner of the page 
% coordinatesCorner = [TopLeftX TopLeftY TopRightX TopRightY BottomRightX
% BottomRightY BottomLeftX BottomLeftY]
coordinatesCorner = [685 411 1339 234 628 768 1432 582];

% Create a matrix where we will add the predicted point of the corner with
% the same logic as coordinatesCorner
predictPoints = coordinatesCorner;
figure,
for n = 1:numFrames
    n
    im=read(vidObj,n);
    imD=double(im);

    % Convert the colored image to grayscale image 
    grayI = grayScale(imD);
    
    % Create a version of the image only with its edges
    [Ix,Iy] = canny(grayI,2);

    % Apply a Harris detection with two different sigma to get the best of
    % the Harris combination 
    D = harris(0.05, Ix, Iy,3).*abs(harris(0.05, Ix, Iy, 5));

    % Set the default size of the search window
    windowSize = 18;
    % Set a different windows size for the TopRightCorner because the
    % Harris could find the hand more saillant than the corner of the page
    windowSizeHand = 13;
    % find the best corner for each 4 corners of the page
    if n == 1
        [ xA,yA ] = findMaxHarrisCorner(D,coordinatesCorner(1),coordinatesCorner(2),windowSize );
        [ xB,yB ] = findMaxHarrisCorner(D,coordinatesCorner(3),coordinatesCorner(4),windowSize);
        [ xC,yC ] = findMaxHarrisCorner(D,coordinatesCorner(5),coordinatesCorner(6),windowSize);
        [ xD,yD ] = findMaxHarrisCorner(D,coordinatesCorner(7),coordinatesCorner(8),windowSize);
    end
    
    if (n > 1)% && (n <= 4)
       [ xA,yA ] = findMaxHarrisCorner(D,coordinatesCorner(n-1,1),coordinatesCorner(n-1,2),windowSize);
       [ xB,yB ] = findMaxHarrisCorner(D,coordinatesCorner(n-1,3),coordinatesCorner(n-1,4),windowSizeHand);
       [ xC,yC ] = findMaxHarrisCorner(D,coordinatesCorner(n-1,5),coordinatesCorner(n-1,6),windowSize);
       [ xD,yD ] = findMaxHarrisCorner(D,coordinatesCorner(n-1,7),coordinatesCorner(n-1,8),windowSize);
    end
     
    % Predict the new coordinates of each corner into the variable coordinatesCorner   
    if n > 4
        predictPoints =  predictCorners(predictPoints,coordinatesCorner,n);
        [ xA,yA ] = findMaxHarrisCorner(D,predictPoints(n-3,1),predictPoints(n-3,2),windowSize);
        [ xB,yB ] = findMaxHarrisCorner(D,predictPoints(n-3,3),predictPoints(n-3,4),windowSizeHand);
        [ xC,yC ] = findMaxHarrisCorner(D,predictPoints(n-3,5),predictPoints(n-3,6),windowSize);
        [ xD,yD ] = findMaxHarrisCorner(D,predictPoints(n-3,7),predictPoints(n-3,8),windowSize);    
    end  
    
    % Save the new coordinates of each corner into the variable coordinatesCorner
    coordinatesCorner = [coordinatesCorner;xA,yA,xB,yB,xC,yC,xD,yD];
    
    % Display the result of the prediction
    imshow(D, [0 20]); %, colormap(flipud(gray(256)));
    hold on
    scatter(xA,yA,50,'r', 'filled')
    scatter(xB,yB,50,'r', 'filled')
    scatter(xC,yC,50,'r', 'filled')
    scatter(xD,yD,50,'r', 'filled')
    
end

% Extract the points to a file
save('pointsCordinates.mat','coordinatesCorner');

