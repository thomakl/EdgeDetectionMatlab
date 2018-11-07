close all
clear all


v2= VideoReader('template.mp4');


for n = [1:250]
    im=read(v2,n);
    im=double(im);

    % Convert the colored image to grayscale image 
    grayI = grayScale(im);
    
    % Apply a Gaussian Filter
    %grayI = gaussianFilter(grayI,5,10);
    % Create a version of the image only with its edges
    [G,Ix,Iy] = canny(grayI,2);

    %imshow(G, [0 400]);
    colormap(flipud(gray(256)));
    

    %[x,y]=cornerPage(G);


    D = harris(G,0.05, Ix, Iy,2).*abs(harris(G,0.05, Ix, Iy, 5));
    %D=max(D,0);
    %colormap(flipud(gray(256)));
    imshow(D, [0 10]);
    
end


