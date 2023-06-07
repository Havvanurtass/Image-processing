clc;
clear;
RGB=imread('Ornek_01.png');
figure,imshow(RGB),title('Orijinal Resim');
I=rgb2gray(RGB);%Renkli Resmi griye �evirme
figure,imshow(I),title('Gri Resim');
figure,bar(imhist(I),'Facecolor','k'),title('Griye D�nd�r�lm�� Resmin Histogram�');
%Tuz arabiber g�r�lt�s� ekleme
f=255*8/100;% %8 oran�nda g�r�lt� ekleme 
NI = I; % NI tuz karabiber ekleyece�imiz resim
Rmatrix = randi([0,255],size(I,1),size(I,2));%sat�r ve s�tunlara rastgele 0 255 de�erleri koy
NI(Rmatrix <=f/2) = 0;%biber g�r�nt�s�   
NI(Rmatrix >f/2&Rmatrix<f) = 255;%tuz g�r�nt�s�

figure,imshow(NI),title('Tuz Biber G�r�lt�s� Eklennmi� Resim');
figure,bar(imhist(NI),'Facecolor','k'),title('Tuz Biber G�r�lt�s� Eklennmi� Resmin Histogram�');

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
figure,bar(imhist(GK),'Facecolor','k'),title('Geometrik Ortalama Filtresi Histogram�');

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
figure,bar(imhist(HK),'Facecolor','k'),title('Harmonik Ortalama Filtresi Histogram�');


