function res1=GaussianBlurImage(image, sigma)

% you can change m and n here to have different kernel sizes.
m=5;
n=5;
sum=0;
Gkernel=zeros(m,n);
for x=-(floor(m/2)):floor(m/2)
    for y=-(floor(n/2)):floor(n/2)
        %gaussian formula
        Gkernel(x + ceil(m/2) ,y + ceil(n/2)) = (exp(-(x^2 + y^2)/(2 * (sigma^2) )))/(2* pi * (sigma^2));
        sum=sum+ Gkernel(x + ceil(m/2) ,y + ceil(n/2));
        % we use sum to normalize our filter
    end
end

NormGkernel=Gkernel/sum;
res1=myconvolution(image,NormGkernel);




end
