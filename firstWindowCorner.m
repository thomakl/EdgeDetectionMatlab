function [xmin, ymin, width, height] = firstWindowCorner( x0,y0,size )
%FIRSTWINDOWCORNER: 
%   With the pixel input, get the the rectangle to crop the image at the
%   size selected
%   xmin : x top left corner of the rectangle
%   ymin : x top left corner of the rectangle
%   width : x width of the rectangle
%   height : height of the rectangle

    xmin = x0 -size;
    ymin = y0 +size;
    width = size;
    height = size;
end


