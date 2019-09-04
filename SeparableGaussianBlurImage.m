function res2=SeparableGaussianBlurImage (image, sigma)


% you can change m and n here to have different kernel sizes.
m=5;
n=5;
GkernelHorizontal=zeros(1,m);
GkernelVertical=zeros(n,1);
sum=0;
for x=-(floor(m/2)):floor(m/2)

    %gaussian formula
    GkernelHorizontal(1,x + ceil(m/2)) = (exp(-(x^2)/(2 * (sigma^2) )))/(2* pi * (sigma^2));
    sum=sum+ GkernelHorizontal(1,x + ceil(m/2));
    % we use sum to normalize our filter
end
NormGkernelHorizontal=GkernelHorizontal/sum;

sum=0;
for y=-(floor(n/2)):floor(n/2)
    %gaussian formula
    GkernelVertical(y + ceil(n/2),1) = (exp(-(y^2)/(2 * (sigma^2) )))/(2* pi * (sigma^2));
    sum=sum+ GkernelVertical(y + ceil(n/2),1);
    % we use sum to normalize our filter
end
NormGkernelVertical=GkernelVertical/sum;


temp=myconvolution(image,NormGkernelHorizontal);
res2=myconvolution(temp,NormGkernelVertical);






end
