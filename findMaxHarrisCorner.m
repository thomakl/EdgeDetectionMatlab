function [ xMaxHarris,yMaxHarris ] = findMaxHarrisCorner( cropH )
%findMaxHarrisCorner Summary of this function goes here
%   Applied to image and get the maximum point of the Harris Image
    maxH = max(max(cropH));
    [xMaxHarris, yMaxHarris]=ind2sub(size(cropH),maxH);
end

