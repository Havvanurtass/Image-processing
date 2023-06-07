clc;
clear;
RGB=imread('Ornek_04.png');%orijinal resmi oku
figure,imshow(RGB),title('Orjinal Renkli Resim');%orijinal resmin ��kt�s�n� verir
I=rgb2gray(RGB);%renkli resmi griye d�n��t�r�r
figure,imshow(I),title('Gri Resim');


SI=zeros(size(I));%sobel filtreleme yapt�ktan sonra  
I=double(I);%G�r�nt�y� double'a d�n��t�r

%Sobel filter maskeleri
F1=[-1 -2 -1;0 0 0; 1 2 1];% x y�n� i�in F1 maskesi
F2=[-1 0 1;-2 0 2; -1 0 1];%y y�n� i�in F2 maskesi

for i=1:size(I,1)-2
    for j=1:size(I,2)-2
        %Gradyan i�lemleri
        Gx=sum(sum(F1.*I(i:i+2,j:j+2)));
        Gy=sum(sum(F2.*I(i:i+2,j:j+2))); 
        %vekt�r�n b�y�kl���n� hesaplama
        SI(i+1,j+1)=sqrt(Gx.^2+Gy.^2);
       
    end
end
SI=uint8(SI);
figure,imshow(SI);title('Sobel Filtresi Uygulanm�� Resim');

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
figure,imshow(RI);title('Robert Filtresi Uygulanm�� Resim');
