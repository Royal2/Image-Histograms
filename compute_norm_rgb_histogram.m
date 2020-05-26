function [output] = compute_norm_rgb_histogram(image_rgb)
%compute_norm_rgb_histogram
%   input = RGB image
%   output = 1x96 vector
% compute the histogram for three channels (r,g,b)
% use 32 bins for each color channel
% concatenate the three histograms together (in the order of R,G,B)
% normalize the combined histogram so it sums to 1
    %32 bins
    bins=32;
    delta=256/bins;
    range=zeros(1,32+1);    %appended zero
    histogram_array=zeros(1,bins,3);
    for channel=1:1:3   %r,g,b
        image=(image_rgb(:,:,channel));
        for i=1:1:bins
            range(i)=(delta*i);
        end
        for i=2:1:bins+1    %offset by one to account for appended zero
            instances=find(image>=range(i-1) & image<range(i));
            histogram_array(1,i-1,channel)=size(instances,1);
        end
        %counting for verification, count should equal 500*750
        count=0;
        for i=1:1:size(histogram_array,2)
            count=count+histogram_array(1,i,channel);
        end
    end
    %concatenating histograms in order of (r,g,b)
    rgb_histogram=[histogram_array(1,:,1),histogram_array(1,:,2),histogram_array(1,:,3)];
    %normalizing to sum of 1
    rgb_histogram=rgb_histogram/norm(rgb_histogram,1);
    %verification of sum of 1
    sum=0;
    for i=1:1:size(rgb_histogram,2)
        sum=sum+rgb_histogram(i);
    end
    output=rgb_histogram;
end

