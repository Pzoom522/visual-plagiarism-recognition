%% ╩р╤хж╠╥╫м╪ящй╬й╣юЩ
figure('Name', 'Grayscale cosine similarity');
stitle = ['grayscale cosine similarity = ', ...
    num2str(hist_cos_similarity('the_elder_watermarked.jpg','the_elder.jpg'))];
image1 = imread('the_elder_watermarked.jpg');
image2 = imread('the_elder.jpg');
subplot(2,2,1);
imshow(image1);
subplot(2,2,2);
imshow(image2);
subplot(2,2,3);
histogram(image1);
subplot(2,2,4);
histogram(image2);
suptitle(stitle);

%% ╩р╤хж╠╥╫м╪ vs RGBж╠╥╫м╪
figure('Name','Grayscale vs RGB cosine similarity')
image1 = imread('peppa_pig.jpg');
image2 = imread('peppa_pig_rgb_swapped.jpg');
subplot(1,2,1);
imshow(image1);
subplot(1,2,2);
imshow(image2);
stitle = ['grayscale cosine similarity = ', ...
    num2str(hist_cos_similarity('peppa_pig.jpg', 'peppa_pig_rgb_swapped.jpg'))];
stitle = {stitle; ['RGB cosine similarity = ', ...
    num2str(hist_cos_similarity_rgb('peppa_pig.jpg', 'peppa_pig_rgb_swapped.jpg'))]};
suptitle(stitle);

%% RGBж╠╥╫м╪ vs MSE/PSNR(RGB)
figure('Name', 'RGB cosine similarity vs MSE/PSNR(RGB)')
image1 = imread('Austria.jpg');
image2 = imread('Germany.png');
subplot(1,2,1);
imshow(image1);
subplot(1,2,2);
imshow(image2);
stitle = ['RGB cosine similarity = ', ...
    num2str(hist_cos_similarity_rgb('Austria.jpg', 'Germany.png'))];
[MSE, PSNR] = pixel_error_rgb('Austria.jpg', 'Germany.png');
stitle = {stitle; ['MSE = ', num2str(MSE), ', PSNR = ', num2str(PSNR), ' dB']};
suptitle(stitle);

%% MSE/PSNR(RGB) vs RGB/PSNR(YUV)
image1 = imread('n.jpg');
image2 = imread('g.jpg');
image3 = imread('b.jpg');

figure1 = figure('PaperSize',[20.98 29.68], 'Name', 'MSE/PSNR(RGB) vs RGB/PSNR(YUV)');
set(gcf, 'position', [0 0 1000 600]);
axes('Parent',figure1,'Position',[0.3552 0.5838 0.3347 0.3412]);
imshow(image1);
title('original image');
subplot(2,2,3,'Parent',figure1);
imshow(image2);
[MSE, PSNR] = pixel_error_rgb('n.jpg', 'g.jpg');
stitle = ['RGB: MSE = ', num2str(MSE), ', PSNR = ', num2str(PSNR), ' dB'];
[MSE, PSNR] = pixel_error_yuv('n.jpg', 'g.jpg');
stitle = {'original image + green';stitle;...
    ['YUV: MSE = ', num2str(MSE), ', PSNR = ', num2str(PSNR), ' dB']};
title(stitle);
subplot(2,2,4,'Parent',figure1);
imshow(image3);
[MSE, PSNR] = pixel_error_rgb('n.jpg', 'b.jpg');
stitle = ['RGB: MSE = ', num2str(MSE), ', PSNR = ', num2str(PSNR), ' dB'];
[MSE, PSNR] = pixel_error_yuv('n.jpg', 'b.jpg');
stitle = {'original image + blue';stitle;...
    ['YUV: MSE = ', num2str(MSE), ', PSNR = ', num2str(PSNR), ' dB']};
title(stitle);

%% MSE/PSNR(YUV) vs SSIM
image0 = imread('бл0.jpg');
image1 = imread('бл1.jpg');
image2 = imread('бл2.jpg');
image3 = imread('бл3.jpg');
image4 = imread('бл4.jpg');

figure('Name', 'MSE/PSNR(YUV) vs SSIM');
set(gcf, 'position', [0 0 1280 400]);
subplot(1,5,1);
imshow(image0);
[MSE, PSNR] = pixel_error_yuv('бл0.jpg', 'бл0.jpg');
stitle = ['MSE = ', num2str(MSE),];
stitle = {stitle; ['PSNR = ', num2str(PSNR), ' dB']};
btitle = ['SSIM(Original) = ', num2str(ssim('бл0.jpg', 'бл0.jpg'))];
btitle = {btitle; ['SSIM(Edged) = ', num2str(edged_ssim('бл0.jpg', 'бл0.jpg'))]};
title(stitle);
xlabel(btitle);

subplot(1,5,2);
imshow(image1);
[MSE, PSNR] = pixel_error_yuv('бл0.jpg', 'бл1.jpg');
stitle = ['MSE = ', num2str(MSE),];
stitle = {stitle; ['PSNR = ', num2str(PSNR), ' dB']};
btitle = ['SSIM(Original) = ', num2str(ssim('бл0.jpg', 'бл1.jpg'))];
btitle = {btitle; ['SSIM(Edged) = ', num2str(edged_ssim('бл0.jpg', 'бл1.jpg'))]};
title(stitle);
xlabel(btitle);

subplot(1,5,3);
imshow(image2);
[MSE, PSNR] = pixel_error_yuv('бл0.jpg', 'бл2.jpg');
stitle = ['MSE = ', num2str(MSE),];
stitle = {stitle; ['PSNR = ', num2str(PSNR), ' dB']};
btitle = ['SSIM(Original) = ', num2str(ssim('бл0.jpg', 'бл2.jpg'))];
btitle = {btitle; ['SSIM(Edged) = ', num2str(edged_ssim('бл0.jpg', 'бл2.jpg'))]};
title(stitle);
xlabel(btitle);

subplot(1,5,4);
imshow(image3);
[MSE, PSNR] = pixel_error_yuv('бл0.jpg', 'бл3.jpg');
stitle = ['MSE = ', num2str(MSE),];
stitle = {stitle; ['PSNR = ', num2str(PSNR), ' dB']};
btitle = ['SSIM(Original) = ', num2str(ssim('бл0.jpg', 'бл3.jpg'))];
btitle = {btitle; ['SSIM(Edged) = ', num2str(edged_ssim('бл0.jpg', 'бл3.jpg'))]};
title(stitle);
xlabel(btitle);

subplot(1,5,5);
imshow(image4);
[MSE, PSNR] = pixel_error_yuv('бл0.jpg', 'бл4.jpg');
stitle = ['MSE = ', num2str(MSE),];
stitle = {stitle; ['PSNR = ', num2str(PSNR), ' dB']};
btitle = ['SSIM(Original) = ', num2str(ssim('бл0.jpg', 'бл4.jpg'))];
btitle = {btitle; ['SSIM(Edged) = ', num2str(edged_ssim('бл0.jpg', 'бл4.jpg'))]};
title(stitle);
xlabel(btitle);

