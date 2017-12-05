function [MSE, PSNR] = pixel_error_yuv(image1_filename, image2_filename)

% ================================逐像素对比方法(YUV)================================
% pixel_error_yuv: 在YUV色彩空间使用逐像素对比方法计算加权均方差和加权峰值信噪比
% -----------------------------------------------------------------------------------
% 输入:
% - image1_filename: 原图像的存储路径及名称(清晰度应不低于对比图像)
% - image2_filename: 对比图像的存储路径及名称(应保证经过调整尺寸后两图片像素一一对应)
% 输出:
% - MSE: 两图片所有像素的加权均方差，越小则相似度越高（对相同图片为0）
% - PSNR: 对比图像相对原图像的加权峰值信噪比，越大则相似度越高（对相同图片为Inf）
% 加权说明:
% - 人眼对三原色敏感程度差异较大，在RGB色彩空间中这种差异很难量化，因此使用RGB色彩空间内
%   的相似度不能很好地反映实际看到的情形。
% - 将RGB颜色转换成YUV色彩空间，增加人眼更敏感的明度(Y'，"'"表示经过Gamma校正)信息的权重
%   可以使量化的相似度更符合人眼的直觉。这里YUV使用NTSC、PAL、MPEG-4等格式中通行的4:1:1
%   比例进行加权。
% ====================================================================================

image1 = double(imread(image1_filename));
image2 = double(imread(image2_filename));
[m, n, ~] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

error_r = abs(double(image1(:, :, 1) - image2(:, :, 1)));
error_g = abs(double(image1(:, :, 2) - image2(:, :, 2)));
error_b = abs(double(image1(:, :, 3) - image2(:, :, 3)));

% 将RGB色彩空间的差值分量线性变换至YUV色彩空间
error_y = 0.299 * error_r + 0.587 * error_g + 0.114 * error_b;
error_u = -0.147 * error_r - 0.289 * error_g + 0.436 * error_b;
error_v = 0.615 * error_r - 0.515 * error_g - 0.100 * error_b;

% 按照4:1:1比例重新分配Y、U、V的权重
error = (error_y * 4 + error_u + error_v) / 6;

MSE = sum(error(:).^2) / (m * n);
PSNR = 10 * log10((255 * 255) / MSE);

return