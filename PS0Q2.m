figure
subplot (3,2,1)

%(1)
imdata = imread('inputPS0Q2.jpg');
      RC = imdata(:,:,2);
      GC = imdata(:,:,1);
      BC = imdata(:,:,3);
      im = cat(3,RC,GC,BC);
      imshow(im)
      imwrite(im, 'swapImgPS0Q2.png');
title('Swapped R-G Channels')

%(2)
subplot (3,2,2)
grayimg = rgb2gray(imdata);
imshow(grayimg)
imwrite(grayimg, 'grayImgPS0Q2.png');
title('Grayscale Image')

%(3.a)
subplot (3,2,3)
negimg = imcomplement(grayimg);
imshow(negimg)
imwrite(negimg, 'negativeImgPS0Q2.png');
title('Negative Image')

%(3.b)
subplot (3,2,4)
mirrorimg = flipdim(grayimg,2); 
imshow(mirrorimg)
imwrite(mirrorimg, 'mirrorImgPS0Q2.png');
title('Mirror Image')

%(3.c)
subplot (3,2,5)
k1=im2double(grayimg);
k2=im2double(mirrorimg);
avgimg = (k1+k2)/2;
%avgimg=uint8(avgimg);
imshow(avgimg)
imwrite(avgimg, 'avgImgPS0Q2.png');
title('Average Image')

%(3.d)
subplot (3,2,6)
N = randi ( [0 255], size(grayimg));
N=uint8(N);
save noise N;
%grayimg=im2double(grayimg);
noiseimg=grayimg+N;
for i=1:size(grayimg,1)
    for j=1:size(grayimg,2)
        if noiseimg(i,j)>255
            noiseimg(i,j)=255;
        end
    end
end
%noiseimg=uint8(noiseimg);
imshow(noiseimg)
imwrite(noiseimg, 'addNoiseImgPS0Q2.png');
title('Noisy Image')