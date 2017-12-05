function [MSE, PSNR] = pixel_error_rgb(image1_filename, image2_filename)

% ================================�����ضԱȷ���(RGB)================================
% pixel_error_rgb: ��RGBɫ�ʿռ�ʹ�������ضԱȷ������������ͷ�ֵ�����
% -----------------------------------------------------------------------------------
% ����:
% - image1_filename: ԭͼ��Ĵ洢·��������(������Ӧ�����ڶԱ�ͼ��)
% - image2_filename: �Ա�ͼ��Ĵ洢·��������(Ӧ��֤���������ߴ����ͼƬ����һһ��Ӧ)
% ���:
% - MSE: ��ͼƬ�������صľ����ԽС�����ƶ�Խ�ߣ�����ͬͼƬΪ0��
% - PSNR: �Ա�ͼ�����ԭͼ��ķ�ֵ����ȣ�Խ�������ƶ�Խ�ߣ�����ͬͼƬΪInf��
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