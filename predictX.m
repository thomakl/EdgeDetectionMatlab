function [X] = predictX(P1,P2)
%predictX Summary of this function goes here
%   Detailed explanation goes here
% P1 : the point in the previous frame (T-1)
% P2 : the point in the second previous frame (T-2)
% P0 : the point predicted in the current frame (T0)


X = P1 + (P1-P2)/2;

end

