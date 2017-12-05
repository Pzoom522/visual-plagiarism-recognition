function [cos_similarity] = hist_cos_similarity(image1_filename, image2_filename, num_bins)

% ================================ֱ��ͼ�������ƶȷ���================================
% hist_cost_similarity: ��������ͼ��ĻҶ�ֱ��ͼ��������ͼƬ��Ӧ������������Ϊ���ƶ�ָ��
% -----------------------------------------------------------------------------------
% ����:
% - image1_filename: ԭͼ��Ĵ洢·��������(����������������Ӧ�����ڶԱ�ͼ��)
% - image2_filename: �Ա�ͼ��Ĵ洢·��������
% - num_bins: ֱ��ͼbin��������Ĭ��Ϊ64
% ���:
% - cos_similarity: ����ͼƬ�Ҷ�ֱ��ͼƵ������������
% ====================================================================================

image1 = imread(image1_filename);
image2 = imread(image2_filename);

% ����ͼ��ߴ�����ͬ(˫���β�ֵ)
[m, n, ~] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

if nargin == 2
    num_bins = 64;
end

% �ԻҶ�ֱ��ͼ����Ƶ����Ϊ����ͼƬ����������
hist1 = histcounts(image1, num_bins);
hist2 = histcounts(image2, num_bins);

% ��������
cos_similarity = dot(hist1, hist2) / (norm(hist1) * norm(hist2));

return