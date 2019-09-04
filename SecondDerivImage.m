function res3b=SecondDerivImage(image,sigma)

%%%%%%% METHOD 1: we can use convolution to compute derivative

xfilter=[-1 0 1];
yfilter=xfilter';

dx=SeparableGaussianBlurImage(xfilter, sigma);
dy=SeparableGaussianBlurImage(yfilter, sigma);

dxx=myconvolution(dx,xfilter);
dyy=myconvolution(dy,yfilter);

temp=myconvolution(image,dxx);
res3b=myconvolution(temp,dyy);





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% METHOD 2: using Mexican Hat filter

%{
MexHat=[0 1 0; 1 -4 1; 0 1 0];
res3b=myconvolution(image,MexHat);
res3b=res3b+128;
figure(35)
imshow(uint8(res3b));
%}
