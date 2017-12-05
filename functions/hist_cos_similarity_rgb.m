function [cos_similarity] = hist_cos_similarity_rgb(image1_filename, image2_filename, num_bins)

% ================================ֱ��ͼ�������ƶȷ���(RGB)================================
% hist_cost_similarity: ��������ͼ�����ԭɫֱ��ͼ��������ͼƬ��Ӧ������������Ϊ���ƶ�ָ��
% ----------------------------------------------------------------------------------------
% ���룺
% - image1_filename: ԭͼ��Ĵ洢·��������(����������������Ӧ�����ڶԱ�ͼ��)
% - image2_filename: �Ա�ͼ��Ĵ洢·��������
% - num_bins: ֱ��ͼbin��������Ĭ�����Ϊ64
% �����
% - cos_similarity: ����ͼƬ��ԭɫֱ��ͼƵ������������
% ====================================================================================

image1 = imread(image1_filename);
image2 = imread(image2_filename);

% ����ͼ��ߴ�����ͬ(˫���β�ֵ)
[m, n, ~] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

if nargin == 2
    num_bins = 64;
end

% ����ԭɫֱ��ͼ����Ƶ������ƴ�ϣ���Ϊ����ͼƬ����������
hist1_r = histcounts(image1(:, :, 1), num_bins);
hist1_g = histcounts(image1(:, :, 2), num_bins);
hist1_b = histcounts(image1(:, :, 3), num_bins);
hist1 = [hist1_r, hist1_g, hist1_b];
hist2_r = histcounts(image2(:, :, 1), num_bins);
hist2_g = histcounts(image2(:, :, 2), num_bins);
hist2_b = histcounts(image2(:, :, 3), num_bins);
hist2 = [hist2_r, hist2_g, hist2_b];

% ��������
cos_similarity = dot(hist1, hist2) / (norm(hist1) * norm(hist2));

return