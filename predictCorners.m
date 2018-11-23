function [predicted] = predictCorners(predictPoints,savePoints,currentFrame)
%predictCorners Summary of this function goes here
%   Predict all the corner of the page according to the current frame
% pxA : predicted coordinate x of the corner A

pxA = predictX(savePoints(currentFrame-1,1),savePoints(currentFrame-2,1));
pyA = predictX(savePoints(currentFrame-1,2),savePoints(currentFrame-2,2));
pxB = predictX(savePoints(currentFrame-1,3),savePoints(currentFrame-2,3));
pyB = predictX(savePoints(currentFrame-1,4),savePoints(currentFrame-2,4));
pxC = predictX(savePoints(currentFrame-1,5),savePoints(currentFrame-2,5));
pyC = predictX(savePoints(currentFrame-1,6),savePoints(currentFrame-2,6));
pxD = predictX(savePoints(currentFrame-1,7),savePoints(currentFrame-2,7));
pyD = predictX(savePoints(currentFrame-1,8),savePoints(currentFrame-2,8));

predicted = [predictPoints;pxA,pyA,pxB,pyB,pxC,pyC,pxD,pyD];

end

