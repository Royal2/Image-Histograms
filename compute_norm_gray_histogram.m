function [output] = compute_norm_gray_histogram(image_rgb)
%compute_norm_gray_histogram
%   input = RGB image
%   output = 1x32 vector
% transfer image to grayscale
% use 32 bins to compute the histogram for the gray image
% normalize to sum of 1
    %image_rgb=imread('forest.jpg');
    
    %transfer to gray scale
    image_gs=rgb2gray(image_rgb);
    %32 bins
    bins=32;
    delta=256/bins;
    range=zeros(1,32);
    for i=1:1:bins
        range(i)=(delta*i);
    end
    histogram_array=zeros(1,bins);
    range=[0,range];    %appending a zero
    for i=2:1:bins+1    %offset by one to account for appended zero
        instances=find(image_gs>=range(i-1) & image_gs<range(i));
        histogram_array(i-1)=size(instances,1);
    end
    %counting for verification, count should equal 500*750
    count=0;
    for i=1:1:size(histogram_array,2)
        count=count+histogram_array(i);
    end
    %normalizing to sum of 1
    histogram_array=histogram_array/norm(histogram_array,1);
    %verification of sum of 1
    sum=0;
    for i=1:1:size(histogram_array,2)
        sum=sum+histogram_array(i);
    end
    output=histogram_array;
end

