function hw1CVsp19

%you can use conv2(image,filter) instead of myconvolution(image, filter) to compare myconvolution function and
%matlab's convolution function, mine is slower, and I used zero padding.

%question 1
figure(1)
Orgimage=imread('hw1_data/Seattle.jpg');
image=rgb2gray(Orgimage);
subplot(1,3,1)
imshow(image);
res1=GaussianBlurImage(image, 4);
res1=uint8(res1);
subplot(1,3,2)
imshow(res1);
imwrite(res1, '1.png');

%comparing with matlab's gaussian filter
B = imgaussfilt(image,4);

subplot(1,3,3)
imshow(B);



%question 2
figure(2)
subplot(1,2,1)
imshow(image);
res2=SeparableGaussianBlurImage(image, 4);
res2=uint8(res2);
subplot(1,2,2)
imshow(res2);
imwrite(res2, '2.png');

%question 3
Orgimage=imread('hw1_data/LadyBug.jpg');
image=rgb2gray(Orgimage);
figure(3)
subplot(1,3,1)
imshow(image);

res3a=FirstDerivImage(image, 1);
res3a=uint8(res3a+128);
subplot(1,3,2)
imshow(res3a);
imwrite(res3a, '3a.png');

res3b=SecondDerivImage(image, 1);
res3b=uint8(res3b+128);
subplot(1,3,3)
imshow(res3b);
imwrite(res3b, '3b.png');

%question 4
Orgimage=imread('hw1_data/Yosemite.png');
image=rgb2gray(Orgimage);
figure(4)
subplot(1,2,1)
imshow(image);
res4=SharpenImage(image, 1, 5);
res4=uint8(res4);
subplot(1,2,2)
imshow(res4);
imwrite(res4, '4.png');


%question 5
Orgimage=imread('hw1_data/LadyBug.jpg');
image=rgb2gray(Orgimage);
figure(5)
subplot(1,2,1)
imshow(image);
[res5a,res5b]=SobelImage(image);
res5a=uint8(res5a);
subplot(1,2,2)
imshow(res5a);
figure(51)
surf(res5b,'EdgeColor','none');
view(2)
imwrite(res5a, '5a.png');


%question 6
Orgimage=imread('hw1_data/Moire_small.jpg');
image=rgb2gray(Orgimage);
figure(6)
subplot(1,3,1)
imshow(image);
[res6a,res6b]=myInterpolation(image);
res6a=uint8(res6a);
res6b=uint8(res6b);
subplot(1,3,2)
imshow(res6a);
subplot(1,3,3)
imshow(res6b);
imwrite(res6a, '6a.png');
imwrite(res6b, '6b.png');

%question 7
Orgimage=imread('hw1_data/Circle.png');
image=rgb2gray(Orgimage);
figure(7)
subplot(1,3,1)
imshow(image);
[res5a,res5b]=SobelImage(image);
subplot(1,3,2)
imshow(uint8(res5a));
res7=FindPeaksImage(image, 40);
res7=uint8(res7);
subplot(1,3,3)
imshow(res7);
imwrite(res7, '7.png');




%written assignment 5
Orgimage=imread('hw1_data/Gogh.png');
image=rgb2gray(Orgimage);
res5written=FindPeaksImage(image, 40);
res5written=uint8(res5written);
figure(8)
subplot(2,3,1)
imshow(res5written);

%blurring image with sigma=1
BlurredImage1=SeparableGaussianBlurImage(image,1);
res5written1=FindPeaksImage(BlurredImage1, 40);
subplot(2,3,2)
imshow(uint8(res5written1));

%blurring image with sigma=3
BlurredImage3=SeparableGaussianBlurImage(image,3);
res5written3=FindPeaksImage(BlurredImage3, 40);
subplot(2,3,3)
imshow(uint8(res5written3));

%blurring image with sigma=5
BlurredImage5=SeparableGaussianBlurImage(image,5);
res5written5=FindPeaksImage(BlurredImage5, 40);
subplot(2,3,4)
imshow(uint8(res5written5));

%blurring image with sigma=8
BlurredImage8=SeparableGaussianBlurImage(image,8);
res5written8=FindPeaksImage(BlurredImage8, 40);
subplot(2,3,5)
imshow(uint8(res5written8))

%blurring image with sigma=16
BlurredImage16=SeparableGaussianBlurImage(image,16);
res5written16=FindPeaksImage(BlurredImage16, 40);
subplot(2,3,6)
imshow(uint8(res5written16))

imwrite(uint8(res5written16),'GoghEdge.png');