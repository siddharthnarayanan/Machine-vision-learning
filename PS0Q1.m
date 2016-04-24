load inputAPS0Q1.mat;

%(a)
B = sort(A(:),'descend');
figure;
plot (B)

%(b)
figure;
hist(A(:),20)

%(c)
X=[];
for i=51:100
    for j=1:50
        X=[X;A(i,j)];
    end
end
X=reshape(X,50,50);
X=X';
figure;
imagesc(X)
save outputXPS0Q1 X;

%(d)
Y=A - mean(mean(A));
figure;
imagesc(Y)
save outputYPS0Q1 Y;

%(e)
Z = repmat(uint8(255.*A),[1 1 3]);
RZ = Z(:,:,1);
GZ = Z(:,:,2);
BZ = Z(:,:,3);
for i=1:size(A,1)
    for j=1:size(A,2)
        if A(i,j)>mean(mean(A))
            RZ(i,j)=255;
            GZ(i,j)=0;
            BZ(i,j)=0;
        else
            RZ(i,j)=0;
            GZ(i,j)=0;
            BZ(i,j)=0;
        end
    end
end
Z = cat(3,RZ,GZ,BZ);
figure;
imagesc(Z)
figure;
imshow(Z)
imwrite(Z, 'outputZPS0Q1.png');