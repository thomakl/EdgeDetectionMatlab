function [outputCoordinatesPage] = saveCoordinates (x1,y1,x2,y2,x3,y3,x4,y4)

TLCorner=[x1,y1];
TRCorner=[x2,y2];
BRCorner=[x3,y3];
BLCorner=[x4,y4];

outputCoordinatesPage =[TLCorner, TRCorner, BRCorner, BLCorner];

save('test.mat','outputCoordinatesPage');
end