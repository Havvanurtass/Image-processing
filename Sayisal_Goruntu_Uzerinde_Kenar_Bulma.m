clc;
clear;
RGB=imread('Ornek_04.png');%orijinal resmi oku
figure,imshow(RGB),title('Orjinal Renkli Resim');%orijinal resmin çýktýsýný verir
I=rgb2gray(RGB);%renkli resmi griye dönüþtürür
figure,imshow(I),title('Gri Resim');


SI=zeros(size(I));%sobel filtreleme yaptýktan sonra  
I=double(I);%Görüntüyü double'a dönüþtür

%Sobel filter maskeleri
F1=[-1 -2 -1;0 0 0; 1 2 1];% x yönü için F1 maskesi
F2=[-1 0 1;-2 0 2; -1 0 1];%y yönü için F2 maskesi

for i=1:size(I,1)-2
    for j=1:size(I,2)-2
        %Gradyan iþlemleri
        Gx=sum(sum(F1.*I(i:i+2,j:j+2)));
        Gy=sum(sum(F2.*I(i:i+2,j:j+2))); 
        %vektörün büyüklüðünü hesaplama
        SI(i+1,j+1)=sqrt(Gx.^2+Gy.^2);
       
    end
end
SI=uint8(SI);
figure,imshow(SI);title('Sobel Filtresi Uygulanmýþ Resim');

%%Robert Filtresi
RI=zeros(size(I));
%Robert filtresi maskeleri
RF1=[-1 0;0 1];
RF2=[0 -1;1 0];
for i=1:size(I,1)-1
    for j=1:size(I,2)-1
        RGx=sum(sum(RF1.*I(i:i+1,j:j+1)));
        RGy=sum(sum(RF2.*I(i:i+1,j:j+1)));
        
        RI(i,j)=sqrt(RGx.^2+RGy.^2);
           
    end
end
RI=uint8(RI);
figure,imshow(RI);title('Robert Filtresi Uygulanmýþ Resim');
