function [predicted] = predictCorners(predictPoints,savePoints,currentFrame)
%predictCorners Summary of this function goes here
%   Predict all the corner of the page according to the current frame
% pxA : predicted coordinate x of the corner A

pxA = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,1));
pyA = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,1));
pxB = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,2));
pyB = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,2));
pxC = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,3));
pyC = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,3));
pxD = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,4));
pyD = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,4));

predicted = [predictPoints;pxA,pyA,pxB,pyB,pxC,pyC,pxD,pyD];

end

