clc;
clear;
I=imread('Ornek_08.png');
figure,imshow(I),title('Orijinal Resim');
figure, bar(imhist(I),'FaceColor','k'),title('Orijinal Resim Histogramý');


ID=double(I);%Orijinal resmin deðerlerini double a çevir
B=padarray(ID,[1 1]);%eklenecek dolgu miktarýný belirtir.
LI=zeros(size(ID));%1.filtre için çýktý
LI1=zeros(size(ID));%2.filtre için çýktý

F1=[0 1 0;1 -4 1;0 1 0];%Filtre1
F2=[-1 -1 -1 ;-1 9 -1;-1 -1 -1];%Filtre2

%Filtre1 Uygulanmasý
for i=1:size(B,1)-2
    for j=1:size(B,2)-2
       
        LI(i,j)=sum(sum(F1.*B(i:i+2,j:j+2)));%2.derece türev 
        
     end
end

LI=uint8(LI);%matrisin veri tipi double çýktýðý için [0,255] arasý deðerlere uint8'e çevirir
figure,imshow(LI),title('Filtre1 Resim');%filtre1 uygulanan resmin çýktýsý
%Ojinal görüntüden Laplacian yapýlan görüntünün filtre1 çýkarýlmasý 
KG=I-LI;
figure,imshow(KG),title('Orjinal-Filtre1 Resim');
figure, bar(imhist(LI),'FaceColor','k'),title('Filtre1 Resim Histogramý');


%%Filtre2 Uygulanmasý 
for i=1:size(B,1)-2
    for j=1:size(B,2)-2
        LI1(i,j)=sum(sum(F2.*B(i:i+2,j:j+2)));
    end
end

LI1=uint8(LI1);%matrisin veri tipi double çýktýðý için [0,255] arasý deðerlere uint8'e çevirir
figure,imshow(LI1),title('Filtre2 Resim');

%Ojinal görüntüden Laplacian yapýlan görüntünün filtre2 çýkarýlmasý 
KG2=I-LI1;
figure,imshow(KG2),title('Orjinal-Filtre2');
figure,bar(imhist(LI1),'FaceColor','k'),title('Filtre2 Resim Histogramý');

