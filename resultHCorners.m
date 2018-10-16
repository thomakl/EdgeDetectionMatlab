image = imread('testA.tif');
image = imresize(image, 0.75);  %# or however much you want to resize if your image is large
[ x, y, scores, Ix, Iy ] = harris_corners( image );
figure; imshow(image) 
hold on
for i = 1:size(scores,2)
    plot(x(i), y(i), 'ro', 'MarkerSize', scores(i) * 2); %# you may need to play with this multiplier or divisor based on your image
                                                         %# I've used --> (/1000) to (* 10)
    
end
saveas(gcf,'your_image_with_corners.png');
hold off