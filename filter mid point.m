X= imread('Abdul.jpeg');
figure,imshow(x),title('original image');
I=imnoise(X,'gaussian');
figure,imshow(I),title('Image with gaussian noise');
[M N] = size(X);
[m n] = size(I);c=ones(3.3)/9;
[p q] = size(c);p=(p-1)/2;q=(q-1)/2;
z=I;
for i=p+1:m-p
    for j=q+1:n-q
        mask1=zeros(3,3);
        for k=-p:p
            for l=-q:p
                mask1(p+1-k,q+1-l)=l(i-k,j-l);
            end
            mid1=mask1(:);
            mid1=(min(mid1)+max(mid1))/2;
            z(i,j)=mid1;
        end
    end
    figure,imshow(uint8(z)),title('mid point filtered image');
end
