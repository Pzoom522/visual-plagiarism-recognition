function [cos_similarity] = hist_cos_similarity(image1_filename, image2_filename, num_bins)

% ================================直方图余弦相似度方法================================
% hist_cost_similarity: 根据两幅图像的灰度直方图，以两幅图片对应向量的余弦作为相似度指标
% -----------------------------------------------------------------------------------
% 输入:
% - image1_filename: 原图像的存储路径及名称(理想条件下清晰度应不低于对比图像)
% - image2_filename: 对比图像的存储路径及名称
% - num_bins: 直方图bin的数量，默认为64
% 输出:
% - cos_similarity: 两幅图片灰度直方图频数向量的余弦
% ====================================================================================

image1 = imread(image1_filename);
image2 = imread(image2_filename);

% 调整图像尺寸至相同(双三次插值)
[m, n, ~] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

if nargin == 2
    num_bins = 64;
end

% 以灰度直方图各组频数作为两幅图片的特征向量
hist1 = histcounts(image1, num_bins);
hist2 = histcounts(image2, num_bins);

% 计算余弦
cos_similarity = dot(hist1, hist2) / (norm(hist1) * norm(hist2));

return