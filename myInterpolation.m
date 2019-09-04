function [res6a,res6b]=myInterpolation(image)

samplingSize=4;
%using nearest neighbor
[m,n]=size(image);
UpsampledNN=zeros(samplingSize*m,samplingSize*n);


for i=1:m
    for j=1:n
        newi=i*samplingSize-(samplingSize-1);
        newj=j*samplingSize-(samplingSize-1);
        for p=newi:newi+samplingSize-1
            for q=newj:newj+samplingSize-1
                UpsampledNN(p,q)=image(i,j);
            end
        end
    end
end

res6a=UpsampledNN;


res6b=BilinearInterpolation(image, 0, 0);











%{
UpsampledBiLinear=zeros(samplingSize*m,samplingSize*n);
for x=1:m
    for y=1:n
        colf=y*(1/4);
        rowf=x*(1/4);
        col=floor(colf);
        row=floor(rowf);
        row(row<1)=1;
        col(col<1)=1;
        row(row>m-1)=m-1;
        col(col>n-1)=n-1;
        a=rowf-row;
        b=colf-col;
        UpsampledBiLinear(x+a,y+b)=mybil(image,x,y);
    end
end
UpsampledBiLinear=uint8(UpsampledBiLinear);
res6b=UpsampledBiLinear;
%}
