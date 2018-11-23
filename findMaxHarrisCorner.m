function [ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner(I,Xo,Yo,size)
%findMaxHarrisCorner Summary of this function goes here
%   Applied to image and get the maximum point of the Harris Image
    max = 0;
    xMaxHarris = Xo;
    yMaxHarris = Yo;
    Xmin = round(Xo)-size;
    Ymin = round(Yo)-size;
    for row = Xmin:Xo+size
        for column = Ymin:Yo+size
            if I(column,row) > max;
                max = I(column,row);
                xMaxHarris = row;
                yMaxHarris = column;
            end
        end
    end
    
end
