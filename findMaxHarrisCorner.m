function [ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner( cropH )
%findMaxHarrisCorner Summary of this function goes here
%   Applied to image and get the maximum point of the Harris Image
    [height, width] = size(image);
    max = 0;
    xMaxHarris = 0;
    yMaxHarris = 0;
    for row = [1:width]
        for column = [1:height]
            if cropH(row,column) > max
                max = cropH(row,column);
                xMaxHarris = row;
                yMaxHarris = column;
        end
    end

%     maxH = max(max(cropH));
%     [xMaxHarris, yMaxHarris]=ind2sub(size(cropH),maxH);
end

