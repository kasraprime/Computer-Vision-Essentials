function res3a=FirstDerivImage(image,sigma)

%%%%%%% METHOD 1: we can use convolution to compute derivative

xfilter=[-1 0 1];
dx=myconvolution(image,xfilter);
%%%Uncomment two lines below to see the result before using gaussian
%figure(31)
%imshow(dx)
res3a=SeparableGaussianBlurImage(dx, sigma);





%%%%%%% METHOD 2: we can use shifting to compute derivative, but the result is less accurate than convolution method
%%%Uncomment block below to use this method
%{

%x axis derivative
dx=image(:, 2:end) - image(:, 1:end-1);
figure(32)
imshow(dx);
res3a=SeparableGaussianBlurImage(dx, sigma);

%}
