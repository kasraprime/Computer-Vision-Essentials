function res4=SharpenImage(image, sigma, alpha)

SecDer=SecondDerivImage(image,sigma);
[m,n]=size(image);
[tm,tn]=size(SecDer);
%Since I used my own implementation of convolution and not Matlab's, and mine is using zero padding,
%The dimensions of the result of myconvolution is not the same as original image,
%So I have to crop the result, so I crop half from the beginning and half from the end both for rows and columns
croppedSecDer=SecDer(1+(tm-m)/2:tm-(tm-m)/2,1+(tn-n)/2:tn-(tn-n)/2);
%I think if we use lower values for alpha we get better results.
res4=double(image)-(alpha*croppedSecDer);
