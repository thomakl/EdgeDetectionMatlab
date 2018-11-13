
x1=0;y1=1;
x2=10;y2=21;
x3=100;y3=15;
x4=4;y4=12;

CoinHG=[x1,y1];
CoinHD=[x2,y2];
CoinBD=[x3,y3];
CoinBG=[x4,y4];

C =[CoinHG, CoinHD, CoinBD, CoinBG];

save('test.mat','C');