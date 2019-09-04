function res6b=BilinearInterpolation(image, x, y)

samplingSize=4;
[m,n]=size(image);
UpsampledBiLinear=zeros(samplingSize*m,samplingSize*n);

[colf,rowf]=meshgrid(1:samplingSize*n,1:samplingSize*m);
colf=colf*(1/samplingSize);
rowf=rowf*(1/samplingSize);
col=floor(colf);
row=floor(rowf);

%handling out of bound indices
col(col>n-1)=n-1;
row(row>m-1)=m-1;
col(col<1)=1;
row(row<1)=1;

a=rowf-row;
b=colf-col;
term1=sub2ind([m,n],row,col);
term2=sub2ind([m,n],row+1,col);
term3=sub2ind([m,n],row,col+1);
term4=sub2ind([m,n],row+1,col+1);
image=double(image);
UpsampledBiLinear=image(term1).*(1-a).*(1-b)+image(term2).*(a).*(1-b)+image(term3).*(1-a).*(b)+image(term4).*(a).*(b);
UpsampledBiLinear=uint8(UpsampledBiLinear);


res6b=UpsampledBiLinear;
