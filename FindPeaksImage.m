function res7=FindPeaksImage(image, thres)

%Using our own implemented version of Sobel to get the edge magnitudes and orientations
[EdgeMagnitude,EdgeOrientation]=SobelImage(image);

[m,n]=size(EdgeMagnitude);

for i=1:m
    for j=1:n
        %computing e0 and e1. There are 8 possible directions  and since they are symmetric we get 4 cases.
        %Which are including left and right neighbors, top and bottom neighbors, and 2 diagonal pair of neighbors
        %diagonal neighbors are (i-1,j-1),(i+1,j+1) and (i-1,j+1),(i+1,j-1)
        e0=0;
        e1=0;
        if  (EdgeOrientation(i,j)>=-22.5 && EdgeOrientation(i,j)<=22.5) || (EdgeOrientation(i,j)>=157.5 && EdgeOrientation(i,j)<=-157.5)
            if j+1<=n
                e1=EdgeMagnitude(i,j+1);
            end

            if j-1>=1
                e0=EdgeMagnitude(i,j-1);
            end

        elseif (EdgeOrientation(i,j)>22.5 && EdgeOrientation(i,j)<=67.5) || (EdgeOrientation(i,j)>-157.5 && EdgeOrientation(i,j)<=-112.5)
            if i-1>=1 && j+1<=n
                e0=EdgeMagnitude(i-1,j+1);
            end

            if i+1<=m && j-1>=1
                e1=EdgeMagnitude(i+1,j-1);
            end
        elseif (EdgeOrientation(i,j)>67.5 && EdgeOrientation(i,j)<=112.5) || (EdgeOrientation(i,j)>-112.5 && EdgeOrientation(i,j)<=-67.5)
            if i-1>=1
                e0=EdgeMagnitude(i-1,j);
            end

            if i+1<=m
                e1=EdgeMagnitude(i+1,j);
            end
        elseif (EdgeOrientation(i,j)>112.5 && EdgeOrientation(i,j)<157.5) || (EdgeOrientation(i,j)>-67.5 && EdgeOrientation(i,j)<-22.5)
            if i-1>=1 && j-1>=1
                e0=EdgeMagnitude(i-1,j-1);
            end

            if i+1<=m && j+1<=n
                e1=EdgeMagnitude(i+1,j+1);
            end
        end
        %non max suppression
        %Comparing the edge magnitude of pixel i,j with threshold and e0 and e1
        if (EdgeMagnitude(i,j)>thres && EdgeMagnitude(i,j)>e0 &&EdgeMagnitude(i,j)>e1)
            EdgeMagnitude(i,j)=255;
        else
            EdgeMagnitude(i,j)=0;
        end
    end
end
res7=EdgeMagnitude;
