%% Problem 2.3(a)
close all;
image_rgb=imread('forest.jpg');
%gray-scale histogram
histogram_gs=compute_norm_gray_histogram(image_rgb);
figure;
bar(histogram_gs, 'FaceColor', [0.75, 0.75, 0.75]);
title('Gray-Scale Histogram');
%rgb histogram
histogram_rgb=compute_norm_rgb_histogram(image_rgb);
figure; hold on;
bar(1:32, histogram_rgb(1:32), 'r');
bar(33:64, histogram_rgb(33:64), 'g');
bar(65:96, histogram_rgb(65:96), 'b');
title('RGB Histogram'); hold off;

%% Problem 2.3(b)
close all;
image_rgb=imread('sunset.jpg');
%gray-scale histogram
histogram_gs=compute_norm_gray_histogram(image_rgb);
figure;
bar(histogram_gs, 'FaceColor', [0.75, 0.75, 0.75]);
title('Gray-Scale Histogram');
%rgb histogram
histogram_rgb=compute_norm_rgb_histogram(image_rgb);
figure; hold on;
bar(1:32, histogram_rgb(1:32), 'r');
bar(33:64, histogram_rgb(33:64), 'g');
bar(65:96, histogram_rgb(65:96), 'b');
title('RGB Histogram'); hold off;
%% Problem 2.3(c)
close all;
image_rgb=imread('forest.jpg');
%flip image
flipped_image=flipdim(image_rgb,2);
imshow(flipped_image);
title('Flipped Image');
%rgb histogram
histogram_rgb=compute_norm_rgb_histogram(flipped_image);
figure; hold on;
bar(1:32, histogram_rgb(1:32), 'r');
bar(33:64, histogram_rgb(33:64), 'g');
bar(65:96, histogram_rgb(65:96), 'b');
title('RGB Histogram'); hold off;

%% Problem 2.3(d)
close all;
image_rgb=imread('forest.jpg');
%double R channel of image
image_2r_gb=cat(3,image_rgb(:,:,1)*2,image_rgb(:,:,2),image_rgb(:,:,3));
imshow(image_2r_gb);
title('Double R Channel Image');
%rgb histogram
histogram_rgb=compute_norm_rgb_histogram(image_2r_gb);
figure; hold on;
bar(1:32, histogram_rgb(1:32), 'r');
bar(33:64, histogram_rgb(33:64), 'g');
bar(65:96, histogram_rgb(65:96), 'b');
title('RGB Histogram'); hold off;