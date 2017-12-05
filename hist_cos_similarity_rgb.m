function [cos_similarity] = hist_cos_similarity_rgb(image1_filename, image2_filename, num_bins)

% ================================直方图余弦相似度方法(RGB)================================
% hist_cost_similarity: 根据两幅图像的三原色直方图，以两幅图片相应向量的余弦作为相似度指标
% ----------------------------------------------------------------------------------------
% 输入：
% - image1_filename: 原图像的存储路径及名称(理想条件下清晰度应不低于对比图像)
% - image2_filename: 对比图像的存储路径及名称
% - num_bins: 直方图bin的数量，默认组距为64
% 输出：
% - cos_similarity: 两幅图片三原色直方图频数向量的余弦
% ====================================================================================

image1 = imread(image1_filename);
image2 = imread(image2_filename);

% 调整图像尺寸至相同(双三次插值)
[m, n, ~] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

if nargin == 2
    num_bins = 64;
end

% 以三原色直方图各组频数（再拼合）作为两幅图片的特征向量
hist1_r = histcounts(image1(:, :, 1), num_bins);
hist1_g = histcounts(image1(:, :, 2), num_bins);
hist1_b = histcounts(image1(:, :, 3), num_bins);
hist1 = [hist1_r, hist1_g, hist1_b];
hist2_r = histcounts(image2(:, :, 1), num_bins);
hist2_g = histcounts(image2(:, :, 2), num_bins);
hist2_b = histcounts(image2(:, :, 3), num_bins);
hist2 = [hist2_r, hist2_g, hist2_b];

% 计算余弦
cos_similarity = dot(hist1, hist2) / (norm(hist1) * norm(hist2));

return