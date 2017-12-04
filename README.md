# visual-plagiarism-recognization
__北航2017年度MatLab大作业。尝试针对图片修改（“盗图”）进行识别、评估与溯源。更多细节请参考[项目slides](http://slides.com/pzoom/matlab/fullscreen)__

## 直方图算法
> 直方图：图像中颜色分布的图形表示
### 灰度直方图
#### 适用情境
+ 改变图片尺寸，进行伸缩、旋转与镜像等线性操作
+ 切边操作（如为了切除水印等）

#### 不适用情境
+ 色阶向量对称（会不受控**误判**为高相似）
+ “同色异形”（会不受控**误判**为高相似）

### RGB直方图
#### 适用情境
+ 针对色阶向量对称进行了优化

## MSE/PSNR算法
> 峰值信噪比：表示信号最大可能功率和影响它的表示精度的破坏性雜訊功率的比值
### RGB
#### 适用情境
+ 针对“同色异形”进行了优化

#### 不适用情境
+ 没有较好地面向生物视觉特征（高相似有可能被**漏判**）

### YUV
#### 适用情境
+ 针对人的生物视觉特征进行了优化

#### 不适用情境
+ 难以侦测常见的“盗绿”现象（高相似有可能被**漏判**）

## SSIM(经典)
> 结构性相似指标：用以衡量两张数位影像相似程度
#### 适用情境
+ 对“盗绿”现象有着较好的效果

## SSIM(改进)
> 改进简述
#### 改进方法
#### 改进效果

## 未来方向
+ 不同风格、相似图源的判定
+ 相同元素的不同组合方式的判定

