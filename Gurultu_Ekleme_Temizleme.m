clc;
clear;
RGB=imread('Ornek_01.png');
figure,imshow(RGB),title('Orijinal Resim');
I=rgb2gray(RGB);%Renkli Resmi griye çevirme
figure,imshow(I),title('Gri Resim');
figure,bar(imhist(I),'Facecolor','k'),title('Griye Döndürülmüþ Resmin Histogramý');
%Tuz arabiber gürültüsü ekleme
f=255*8/100;% %8 oranýnda gürültü ekleme 
NI = I; % NI tuz karabiber ekleyeceðimiz resim
Rmatrix = randi([0,255],size(I,1),size(I,2));%satýr ve sütunlara rastgele 0 255 deðerleri koy
NI(Rmatrix <=f/2) = 0;%biber görüntüsü   
NI(Rmatrix >f/2&Rmatrix<f) = 255;%tuz görüntüsü

figure,imshow(NI),title('Tuz Biber Gürültüsü Eklennmiþ Resim');
figure,bar(imhist(NI),'Facecolor','k'),title('Tuz Biber Gürültüsü Eklennmiþ Resmin Histogramý');

%%geometrik ortalama
GK=zeros(size(I));
for x=1:size(I,1)-2
    for y=1:size(I,2)-2
        %Geometrik Filtre
        GF=zeros(9,1); 
        s=1;
        for k=1:3
            for l=1:3
                GF(s)=NI(x+k-1,y+l-1);
                s=s+1;
            end
        end
        GK(x,y)=geomean(GF);%Geometrik Ortalama
    end
end
GK=uint8(GK);
figure,imshow(GK),title('Geometrik Ortalama Filtresi Uygulanan Resim');
figure,bar(imhist(GK),'Facecolor','k'),title('Geometrik Ortalama Filtresi Histogramý');

%%harmonik ortalama
HK=zeros(size(I));
for x=1:size(I,1)-2
    for y=1:size(I,2)-2
        %Harmonik Filtre
        HF=zeros(9,1); 
        s=1;
        for k=1:3
            for l=1:3
                HF(s)=NI(x+k-1,y+l-1);
                s=s+1;
            end
        end
        HK(x,y)=harmmean(HF);% harmonik ortalama
    end
end
HK=uint8(HK);
figure,imshow(HK),title('Harmonik Ortalama Filtresi Uygulanan Resim');
figure,bar(imhist(HK),'Facecolor','k'),title('Harmonik Ortalama Filtresi Histogramý');


