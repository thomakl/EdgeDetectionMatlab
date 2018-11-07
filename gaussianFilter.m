function [ Ifilt ] = guassianFilter( I,sigmaGauss, sizeFilter )
%GUASSIANFILTER Summary of this function goes here
    %  Create a Gaussian Filter
    % sigmaGauss : "Standart deviation of the filter / intensity"
    % sizeFilter : "length of gaussFilter vector"
x = linspace(-sizeFilter / 2, sizeFilter / 2, sizeFilter);
gaussFilter = exp(-x .^ 2 / (2 * sigmaGauss ^ 2));

gaussFilter = gaussFilter / sum (gaussFilter); % normalize

%apply the gaussian filter on the image
Ifilt = convn(I, gaussFilter, 'same');  

end