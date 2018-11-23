function [ xMaxHarris,yMaxHarris ] = CornerAnalysis(I,Xo,Yo,size )
%CornerAnalysis Summary of this function goes here
%   - Take the xo,yo of the point extracted with ginput
%   - create a window with firstWindowCorner(xo,yo,size) function
%   - Crop the Harris Result image with cropImage(harrisImage,[xmin, ymin,
%   width, height])
%    - apply the findMaxHarrisCorner function and get the localisation of
%    the max value (the corner)
%   - Return the [X,Y] value of the "corner" in the whole image
    %close all
    %imCropPXY = imcrop(I,[Xo-size Yo-size 2*size 2*size]);
    %imshow(imCropPXY)
    
    
    % Apply the findMaxHarrisCorner
    [ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner(I,Xo,Yo,size);   
    
    %hold on 
    %scatter(xMaxHarris,yMaxHarris)
%  Return the [X,Y] value of the corner

% --------------- Check those two lines : the scatter is not correctly on
% the corner but near it.
    %pX = Xo;
    %pY = Yo;

end

