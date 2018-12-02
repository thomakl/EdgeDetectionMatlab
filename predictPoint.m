function [predictedPoint] = predictPoint(P1,P2)
% predictPoint : Take the difference between two points, divide it by two
% and add it to the point of the previous frame
% P1 : the point in the previous frame (T-1)
% P2 : the point in the second previous frame (T-2)
% predictedPoint : the point predicted in the current frame (T0)
predictedPoint = ceil(P1 + (P1-P2)/2);

end

