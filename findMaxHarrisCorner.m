function [ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner(I,Xo,Yo,size)
%findMaxHarrisCorner : Create a search window centered by the Point [Xo,Yo]
%and "size" wide. With this search window look for the point which have the
%max Harris value. Then extract the coordinates of this point.
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
