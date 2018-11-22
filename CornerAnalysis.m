function [ pX,pY ] = CornerAnalysis(I,Xo,Yo,size )
%CornerAnalysis Summary of this function goes here
%   - Take the xo,yo of the point extracted with ginput
%   - create a window with firstWindowCorner(xo,yo,size) function
%   - Crop the Harris Result image with cropImage(harrisImage,[xmin, ymin,
%   width, height])
%    - apply the findMaxHarrisCorner function and get the localisation of
%    the max value (the corner)
%   - Return the [X,Y] value of the "corner" in the whole image

    imCropPXY = imcrop(I,[Xo-size Yo-size 2*size 2*size]);
    
% Apply the findMaxHarrisCorner
    [ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner(imCropPXY);
%  Return the [X,Y] value of the corner
    pX = xMaxHarris+Xo;
    pY = yMaxHarris+Yo;

end

