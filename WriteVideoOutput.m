function [ Message ] = WriteVideoOutput(F)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %------------ Ecrire la video -----------------------

    % create the video writer with 1 fps
    writerObj = VideoWriter('myVideo.mp4', 'MPEG-4');
    writerObj.FrameRate = 2;
    % set the seconds per image

    % open the video writer
    open(writerObj);

    % write the frames to the video
    for i=1:length(F)
        % convert the image to a frame
        frame = F(i) ;    
        writeVideo(writerObj, frame);
    end
    % close the writer object
    close(writerObj);
    Message = 'Good';



end

