function [C] = SauvegardeCoordonnees (x1,y1,x2,y2,x3,y3,x4,y4)

CoinHG=[x1,y1];
CoinHD=[x2,y2];
CoinBD=[x3,y3];
CoinBG=[x4,y4];

C =[CoinHG, CoinHD, CoinBD, CoinBG];

save('test.mat','C');
end