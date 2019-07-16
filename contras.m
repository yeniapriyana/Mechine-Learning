clear all;

I=imread('latih1.jpg');
    figure(1),imshow(I);title('Original Image');

Red= I(:,:,1);
Green= I(:,:,2);
Blue= I(:,:,3); %memisahkan setiap warna RGB

reds= adapthisteq(Red);
greens= adapthisteq(Green);
blues= adapthisteq(Blue); 
%mempertajam kontrasnya dengan Contrast Limited Adaptive Histogram
%Eualization (CLAHE) pada tiap layar warnanya

edgeSharp(:,:,1)= reds;
edgeSharp(:,:,2)= greens;
edgeSharp(:,:,3)= blues; %menggambungkan kembali ketiga warna

figure(2),imshow(edgeSharp);
title ('1. Contrast Strecthing (CLAHE)')

Gray = rgb2gray(edgeSharp); %mengubah citra warna menjadi citra grayscale    
figure(3),imshow(Gray);
title('2. Greyscale Image')

bw = im2bw(Gray,165/255); %mengkonversikan citra gray menjadi citra biner dengan threshold
figure(4),imshow(bw);
title('3. Citra Biner')

bw = imcomplement(bw);
figure(4),imshow(bw);
title('4. In Biner')

bw = imfill(bw,'holes'); %perbaikan garis tepi citra
bw = bwareaopen(bw,100); %untuk menghilangkan object kecil pada matriks citra dengan menghilangkan 
                            %luasan yang kurang dari 100
str = strel('disk',5);
bw = imerode(bw,str);
figure(5),imshow(bw);
title('5. Biner Halus')

R = edgeSharp(:,:,1);
G = edgeSharp(:,:,2);
B = edgeSharp(:,:,3);

R(~bw) =0; %pembacaan nilai tepi RGB
G(~bw) =0;
B(~bw) =0;

RGB_stretch = cat(3,R,G,B);
figure(6),imshow(RGB_stretch);
title('6. Citra Hasil');

Reds= RGB_stretch(:,:,1);
Greens= RGB_stretch(:,:,2);
Blues= RGB_stretch(:,:,3);

figure(7),imhist(Reds); 

figure(8),imhist(Greens);

figure(9),imhist(Blues);