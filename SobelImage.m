function [res5a,res5b]=SobelImage(image)

VerticalSobelFilter=[1 0 -1; 2 0 -2; 1 0 -1]; %derivative along x axis
HorizontalalSobelFilter=VerticalSobelFilter'; %derivative along y axis
VerticalEdge=myconvolution(image,VerticalSobelFilter);
HorizontalEdge=myconvolution(image,HorizontalalSobelFilter);
magnitude=sqrt(VerticalEdge.^2 + HorizontalEdge.^2);
res5a=magnitude;

Orientation = atan2( HorizontalEdge, VerticalEdge) * (180.0/pi);
res5b=Orientation;


%if you want to see the vectors of gradients you can Uncomment the code below
% I executed the code below once and saved the output as 5bb.png

%{
[m, n] = size(image);
xindex = 4:4:m;
yindex = 4:4:n;
[X,Y] = meshgrid(xindex,yindex);
q=quiver(Y',X',abs(VerticalEdge(xindex,yindex)),abs(HorizontalEdge(xindex,yindex)));
q.Color = 'red';
%}
