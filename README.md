# EdgeDetectionMatlab
School projetct for detecting the edge of a paper and replace the content by something virtual (AR) on Matlab

This project is focussing on detecting the edge of the paper and predicting the location of the corners in the next frame of the video (knowing that the paper is moving on the table) **from scratch**

## Methodology

### GrayScale

Turning the color image to gray to get the perfect Canny Edge Detector

### Canny Edge Detector

Gaussian Derivative Filter with sigma equal to 2 in order to get gradient (the intensity of the edge according to X and Y axis)

### Harris Corner Detection

First Harris : the GaussianFilter with sigma equal to 3
Second Harris : the GaussianFilter with sigma equal to 5

Result Harris = First Harris * abs(Second Harris)

### Predicting Corner


# Main Program 
CornerDetection.m : 
- Call the video
- Take each frame of the video
- Apply each function describe below to get the corner of the page
- Get the coordinates {X,Y} of each corner of the paper

# Functions
grayScale.m  : Converting colored image into grayscale image : better for Canny

canny.m : Canny Edge Detection applied to the image

harris.m : Harris Corner Detection applied to the image

findMaxHarrisCorner : Create a search window around a point (X,Y) and look fo the maximum of Harris