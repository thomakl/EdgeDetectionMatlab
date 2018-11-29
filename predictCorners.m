function [predicted] = predictCorners(predictPoints,savePoints,n)
% predictCorners : Predict the nex point according the 2 previous points
% predictPoints : matrix with all the predicted points
% savePoints : matrix with all coordinates of the corner 
% n : currentFrame
% pxA : predicted coordinate x of the corner A
% pyA : predicted coordinate y of the corner B
% etc...


pxA = predictPoint(savePoints(n-1,1),savePoints(n-2,1));
pyA = predictPoint(savePoints(n-1,2),savePoints(n-2,2));
pxB = predictPoint(savePoints(n-1,3),savePoints(n-2,3));
pyB = predictPoint(savePoints(n-1,4),savePoints(n-2,4));
pxC = predictPoint(savePoints(n-1,5),savePoints(n-2,5));
pyC = predictPoint(savePoints(n-1,6),savePoints(n-2,6));
pxD = predictPoint(savePoints(n-1,7),savePoints(n-2,7));
pyD = predictPoint(savePoints(n-1,8),savePoints(n-2,8));

predicted = [predictPoints;pxA,pyA,pxB,pyB,pxC,pyC,pxD,pyD];

end

