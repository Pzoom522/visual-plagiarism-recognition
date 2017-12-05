function [MSE, PSNR] = pixel_error_rgb(image1_filename, image2_filename)

% ================================逐像素对比方法(RGB)================================
% pixel_error_rgb: 在RGB色彩空间使用逐像素对比方法计算均方差和峰值信噪比
% -----------------------------------------------------------------------------------
% 输入:
% - image1_filename: 原图像的存储路径及名称(清晰度应不低于对比图像)
% - image2_filename: 对比图像的存储路径及名称(应保证经过调整尺寸后两图片像素一一对应)
% 输出:
% - MSE: 两图片所有像素的均方差，越小则相似度越高（对相同图片为0）
% - PSNR: 对比图像相对原图像的峰值信噪比，越大则相似度越高（对相同图片为Inf）
% ====================================================================================

image1 = double(imread(image1_filename));
image2 = double(imread(image2_filename));
[m, n, c] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

error_r = double(image1(:, :, 1) - image2(:, :, 1));
error_g = double(image1(:, :, 2) - image2(:, :, 2));
error_b = double(image1(:, :, 3) - image2(:, :, 3));

error = (error_r + error_g + error_b) / c;
MSE = sum(error(:).^2) / (m * n);
PSNR = 10 * log10((255 * 255) / MSE);

return