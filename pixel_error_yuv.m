function [MSE, PSNR] = pixel_error_yuv(image1_filename, image2_filename)

% ================================�����ضԱȷ���(YUV)================================
% pixel_error_yuv: ��YUVɫ�ʿռ�ʹ�������ضԱȷ��������Ȩ������ͼ�Ȩ��ֵ�����
% -----------------------------------------------------------------------------------
% ����:
% - image1_filename: ԭͼ��Ĵ洢·��������(������Ӧ�����ڶԱ�ͼ��)
% - image2_filename: �Ա�ͼ��Ĵ洢·��������(Ӧ��֤���������ߴ����ͼƬ����һһ��Ӧ)
% ���:
% - MSE: ��ͼƬ�������صļ�Ȩ�����ԽС�����ƶ�Խ�ߣ�����ͬͼƬΪ0��
% - PSNR: �Ա�ͼ�����ԭͼ��ļ�Ȩ��ֵ����ȣ�Խ�������ƶ�Խ�ߣ�����ͬͼƬΪInf��
% ��Ȩ˵��:
% - ���۶���ԭɫ���г̶Ȳ���ϴ���RGBɫ�ʿռ������ֲ���������������ʹ��RGBɫ�ʿռ���
%   �����ƶȲ��ܺܺõط�ӳʵ�ʿ��������Ρ�
% - ��RGB��ɫת����YUVɫ�ʿռ䣬�������۸����е�����(Y'��"'"��ʾ����GammaУ��)��Ϣ��Ȩ��
%   ����ʹ���������ƶȸ��������۵�ֱ��������YUVʹ��NTSC��PAL��MPEG-4�ȸ�ʽ��ͨ�е�4:1:1
%   �������м�Ȩ��
% ====================================================================================

image1 = double(imread(image1_filename));
image2 = double(imread(image2_filename));
[m, n, ~] = size(image1);
image2 = imresize(image2, [m, n], 'bicubic');

error_r = abs(double(image1(:, :, 1) - image2(:, :, 1)));
error_g = abs(double(image1(:, :, 2) - image2(:, :, 2)));
error_b = abs(double(image1(:, :, 3) - image2(:, :, 3)));

% ��RGBɫ�ʿռ�Ĳ�ֵ�������Ա任��YUVɫ�ʿռ�
error_y = 0.299 * error_r + 0.587 * error_g + 0.114 * error_b;
error_u = -0.147 * error_r - 0.289 * error_g + 0.436 * error_b;
error_v = 0.615 * error_r - 0.515 * error_g - 0.100 * error_b;

% ����4:1:1�������·���Y��U��V��Ȩ��
error = (error_y * 4 + error_u + error_v) / 6;

MSE = sum(error(:).^2) / (m * n);
PSNR = 10 * log10((255 * 255) / MSE);

return